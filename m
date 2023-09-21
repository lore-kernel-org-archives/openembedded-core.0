Return-Path: <tobias.hagelborn@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B071E7070A
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 10:17:00 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.12646.1695291415164407935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 03:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=eNVhVm0d;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: tobias.hagelborn@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1695291416;
  x=1726827416;
  h=subject:to:message-id:date:from:mime-version;
  bh=3MlsHtGpr35IPSlId/49RIXA/q1rINMtLWamUS2TlGM=;
  b=eNVhVm0dXYRyBwhnF4xWe9/leQ3Ls5uFHcBGRi3RpJDj8SSPHE8y7cza
   8UATeY+nYZH6Xn7CIukuxxltbqi9VCkF/3/V1GQmbk1Q1s3/a9hBfhITc
   u0/D8WafzqWvx3wv8ABQpQucUKfDzdJERVSjzrwwaSo2TYdWb31vqdsix
   a7xw9QcNBD3tP3nu3hsIYn4xsGrGE2C3OyiiPK4TZgyWuDu3OcYQZMy56
   /qSiIYv2Rqk7vEKLWlZvox0up41I1hZ9dJiA2zM75mVGZkFTmshB+vmrA
   7yGCmMtyV5Y5XHfSBZlreqFrLu8lqvY2xeR/u6zMKbcaJrTOkkcYQhT8M
   w==;
Subject: Findings from using Hash Equivalence server
To: <openembedded-core@lists.openembedded.org>
X-Mailer: mail (GNU Mailutils 3.10)
Message-ID: <20230921101337.090BDB257EA@pc37511-1950.se.axis.com>
Date: Thu, 21 Sep 2023 12:13:37 +0200
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 10:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187988

Findings from using Hash Equivalence server at scale:
=====================================================

We have now used the OE Hash Equivalence server at scale in our C/I chain at our company.
This has given some insights in what works and what can be improved when running this
service in full production.

Some stats from our run:
------------------------

### Hash Equivalence server:
* ~30M reqs/day
* ~500K new entries/day
* 2-3K reqs/s
* Data growth ~10GiB/day (with dbg info)

### C/I Builds:
* ~20K builds/day
* 15-20K tasks/build
* 140K sstate misses/day.

The good:
---------
* It works! It finds reusable sstate tasks (in all of our builds)
* It is very valuable in recipes that invalidate
  almost any other package. (Examples: glib, openssl)
* Hashserve scales to the need even if only running one instance
  - Tested for 12K req/s which was sufficient for our needs
* Robust enough (if no external cleanup takes place)
  - _No_ non-recoverable crashes during 300M requests served

The client site (Bitbake):
--------------------------
We have added a sanity check that disables the use of a remote HE server and switches
to a local one if the remote HE server cannot be connected. This is done from the
"ConfigParsed" event. The reason for this is to avoid builds hanging in case 
the remote HE server is not responding.

Areas of improvement:
---------------------

### Data retention:
There is no built in data-retention. Solving this with recurring external
cleanup script. It works but also exposed locking in the server resulting
in inter-lock with the external cleanup and timeout for the clients.
This can partially be the nature of SQLite and a single file database.
OE Hashserve is not built for cleaning up data and the data growth is high so
it has to be handled.

### Protocol:
As our first tested option for deployment was Kubernetes, the absence of the de-facto
standard HTTP(s) protocol required some workarounds.
Routing, authentication and monitoring support gets lost on the way. I would suggest that we
look into using HTTP(s) + JSON and some Basic Auth as the next basis of the protocol.

### Security:
Supply-chain attacks is nowadays something to be aware of. This service uses a
non encrypted and non authenticated protocol and is thus open to man-in-the-middle
attacks, or any type of fake data and manipulation. The protocol changes suggested above
could mitigate some of this. Additionally, one thought is for the client to 
provide a signature of the hash together with the hash so that it can be verified by the client using
it's secret upon retrieval.

### External database connection
An option for an external DB (For example PostgreSQL) would improve the 
possibility for concurrent cleanup and vacuum while running.
In the stateless world of cloud/containers/pods, an option for external DB
would be favorable.
This would probably make use of some external package for DB interaction so it would
differ a little from the standard python only nature of Bitbake in general.

### Nice to have
- Minor changes that should be more easily added as patches

* Hash (LRU) cache. From our stats, there seem to be a 1:20 ratio in writes to reads
  from the DB so a cache might save some resources.

Conclusions
===========
Hashserve is FOSS and if we want improvements, we have to contribute.
I will investigate to what extent we can chip in on some of these parts.
However, especially for the protocol and maybe also on external Python
dependencies, via PyPI, it would be nice to know if this is acceptable and
wished-for changes, before starting out.

