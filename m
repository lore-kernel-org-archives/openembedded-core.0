Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B42CA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 09:49:22 +0000 (UTC)
Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web10.6210.1755856152713892226
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 02:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=SvgK2WSE;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=32232f072=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1755856152; x=1787392152;
  h=message-id:date:mime-version:from:subject:to:
   content-transfer-encoding;
  bh=/Pf74G3LQenMZSFsiyggKwT41Khx7KaPpXpYWWAJJJ0=;
  b=SvgK2WSEZrG5owXLHL0/XeKIVG8djAfHs1kkY1JjXoQucoyR9fsEL5bB
   WesVb4AK9bJ64uxzwjt2yE01bFbAR3oWuimf4qJHGgaUmSc2NBeSyjezS
   jjr/PDYHp+clajMwL9vuC6ru57KxtKyEJRIhrf8AgncWKeH3+zZbmqN/e
   Q=;
X-CSE-ConnectionGUID: fjyJ2HrURnm2NJQNEzQl0w==
X-CSE-MsgGUID: H+4RQZTETWW1vdyvUNfgLw==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 22 Aug 2025 11:49:10 +0200
Received: from unknown (HELO esabb3.muc) ([10.31.187.134]) by esagw2.muc with
 ESMTP/TLS; 22 Aug 2025 11:49:10 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb3.muc with ESMTP/TLS; 22 Aug 2025 11:49:10 +0200
Received: from [10.242.8.44] (10.30.85.206) by smucmp19d.europe.bmw.corp
 (2a03:1e80:a15:58f::205d) with Microsoft SMTP Server (version=TLS;
 Fri, 22 Aug 2025 11:49:09 +0200
X-CSE-ConnectionGUID: bHavmU0NSsygM5P663AFPA==
X-CSE-MsgGUID: OZblu6e6TX2mvbCgMgLDiw==
X-CSE-ConnectionGUID: PMJB+XgkSS6OULvZ9wi03A==
X-CSE-MsgGUID: VVjuaqNMRiWtyVy6q0611w==
Message-ID: <3d004c3f-7799-47be-b64e-5a944f848412@bmw.de>
Date: Fri, 22 Aug 2025 11:49:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Philip Lorenz <philip.lorenz@bmw.de>
Subject: Auto appending of source revision to PKGV
To: <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SMUCMP10F.europe.bmw.corp (2a03:1e80:a15:58f::202c) To
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 09:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222311

Hi,

we have noticed that starting with 62afa02d01 ([1]) the source revision 
is now always appended when the string "+" is found in PKGV. When used 
with gitpkgv in its recommended configuration (i.e. PKGV = 
"1.0+git${GITPKGV}") this now leads to source revisions being listed 
twice (e.g. 1.0+gitr777+4b27fa4+4b27fa49ff).

This could arguably be avoided by dropping the use of GITPKGV but we had 
to disable PRserv in our deployment ([2]) so we also rely on GITPKGV's 
revision count to ensure monotonically increasing package version numbers.

I see a number of ways out of this but they all come with drawbacks so 
I'd like to initiate a discussion before sending in some concrete patches:

1. Make appending of SRCPV in package.bbclass dependent on a 
configuration variable. This way users can opt into the behaviour either 
globally or on a per recipe basis. The major drawback I see is that this 
adds yet another configuration variable thus introducing complexity.

2. To determine the source revision, the sortable_revision() method of 
the fetchers gets called. The git fetcher doesn't implement this and 
instead solely relies on PRserv to provide the sortable property of the 
version string. sortable_revision() could be implemented for the git 
fetcher to delegate revision creation to gitpkgv_revision() (which 
includes the number of commits) making the version sortable (ignoring 
corner cases such as switching between branches without incrementing 
PV). This however comes with drawbacks such as redundant sorting 
information (when PRserv is used) and the added overhead of reading the 
commit count from disk after it has initially been cached.

3. Like 2. but make the use of gitpkgv_revision() dependent on the 
availability of PRserv (or any service which can provide an increasing 
AUTOINC). This however has the drawback that fetchers now need to know 
whether an AUTOINC provider is available. Given that the 
sortable_revision() prototype already indicates whether AUTOINC is 
needed, providing its presence as an input parameter could be acceptable.

Br,

Philip

[1] 
https://git.yoctoproject.org/poky/diff/meta/classes-global/package.bbclass?id=62afa02d01794376efab75623f42e7e08af08526
[2] 
https://lists.yoctoproject.org/g/yocto/topic/version_going_backwards/109194097

-- 
Philip Lorenz
BMW Car IT GmbH, Software-Plattform, -Integration Connected Company, Lise-Meitner-Straße 14, 89081 Ulm
-------------------------------------------------------------------------
BMW Car IT GmbH
Management: Michael Böttrich, Chris Brandt, Christian Salzmann
Domicile and Court of Registry: München HRB 134810
-------------------------------------------------------------------------


