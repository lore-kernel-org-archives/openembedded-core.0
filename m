Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B520CC6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 14:16:44 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.6882.1663165001097889607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 07:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HOJfNhEl;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id h3so10036200lja.1;
        Wed, 14 Sep 2022 07:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=kcZp4VEcv4gH2e86qFBOnyeBH3qjru+P+QrthLLSGbs=;
        b=HOJfNhElKZLyywwuyPzJYL9HU0Ixd/D9ZNKLLFCfKuRCsh3hZk11MgvNIJ1divUCN4
         8GWmtrd3bHYXv0Q34CATaeDVym5CGvgGo5FCpVVb1prHKECO3x4qSyveriCuMQA5HJ6/
         aBKxe2Ynr2sm4jwYa4jCXa+CnEJ4SfWNEBXZvQbjsu21NQ+/IZbxfP8jV5JRDbZfijiV
         I7k6SnxcqCMQmitQXkH8f9y9Ccc40JTcZn3hZqO/V+92u7e8wiieHfz4LP2jwBJuJr07
         kBy8w259x4+5R45UIYoXg2yaEBVeYTDJHohJaE5v4lB0TqRcUu21QOvWgP6EM1DJo+eM
         zIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=kcZp4VEcv4gH2e86qFBOnyeBH3qjru+P+QrthLLSGbs=;
        b=MlqEwoE11u+yCqPxXi64OeUQxHQBY/jDXx1yqlXi0AiPVMCEDtjsobDgTEl5wnHUlH
         mwnMQ5yKM1W3f05JN7E0HG4KD6gWwxeh/H806vdVK64oESSxVdlEsodUY6orkDc5pH0C
         zyhfhhwktnJ0aYh1laMlo51q54gFuN+D+7n1M5UzFUAOJ823Y1kaB3t4jOe+vP7N5AXg
         P3F5rcdCnvmFeAEGy/xLbnhgqr0H/nV+yxuJMtHiEmUTrUwIih4O8zNedlxiji+LgJIO
         +n+x2S6s358Z86Wz+WAKxZPU6rWfcaUGwBlqR7cPc7yeGiKFJF655zlO1xpFZaVSVyyb
         17jg==
X-Gm-Message-State: ACgBeo2Wl5Om+8I7ETAAhHDy4lua8VMeTIkMz4lSNJXD0ykYsbObcuSS
	5IH7zY8NuU7oooCzdhgqKiumhLWxC2ScS+iF/2D3Cx1Rr9oEZiLD
X-Google-Smtp-Source: 
 AA6agR6Vhx7rHPsElG7AZjjLF27z9KLszk/qsFkpoBS1hqWTZh/TSiMV5AoIbUZsjFqf+O8tqcklAmwrLPsSkH+GuZg=
X-Received: by 2002:a2e:a887:0:b0:25e:3174:fb67 with SMTP id
 m7-20020a2ea887000000b0025e3174fb67mr10260599ljq.337.1663164998790; Wed, 14
 Sep 2022 07:16:38 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 14 Sep 2022 16:16:27 +0200
Message-ID: 
 <CAApg2=Q0+GqNVfyhnnadaEhXUB67_vbf5=ukKHdD8xRHqSOptg@mail.gmail.com>
Subject: Adding more information to the SBOM
To: OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture@lists.openembedded.org,
	Joshua Watt <JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 14:16:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170659

Dear all,
(cross-posting to oe-core and *-architecture)
In the last months, we have worked in Oniro on using the create-spdx
class for both IP compliance and security.

During this work, Alberto Pianon has found that some information is
missing from the SBOM and it does not contain enough for Software
Composition Analysis. The main missing point is the relation between
the actual upstream sources and the final binaries (create-spdx uses
composite sources).

Alberto has worked on how to obtain the missing data and now has a
POC. This POC provides full source-to-binary tracking of Yocto builds
through a couple of scripts (intended to be transformed into a new
bbclass at a later stage). The goal is to add the missing pieces of
information in order to get a "real" SBOM from Yocto, which should, at
a minimum:

- carefully describe what is found in a final image (i.e. binary files
and their dependencies), since that is what is actually distributed
and goes into the final product;
- describe how such binary files have been generated and where they
come from (i.e. upstream sources, including patches and other stuff
added from meta-layers); provenance is important for a number of
reasons related to IP Compliance and security.

The aim is to become able to:

- map binaries to their corresponding upstream source packages (and
not to the "internal" source packages created by recipes by combining
multiple upstream sources and patches)
- map binaries to the source files that have been actually used to
build them - which usually are a small subset of the whole source
package

With respect to IP compliance, this would allow to, among other things:

- get the real license text for each binary file, by getting the
license of the specific source files it has been generated from
(provided by Fossology, for instance), - and not the main license
stated in the corresponding recipe (which may be as confusing as
GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause & BSD-4-Clause, or
even worse)
- automatically check license incompatibilities at the binary file level.

Other possible interesting things could be done also on the security side.

This work intends to add a way to provide additional data that can be
used by create-spdx, not to replace create-spdx in any way.

The sources with a long README are available at
https://gitlab.eclipse.org/eclipse/oniro-compliancetoolchain/toolchain/tinfoilhat/-/tree/srctracker/srctracker

What do you think of this work? Would it be of interest to integrate
into YP at some point? Shall we discuss this?

Marta and Alberto

