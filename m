Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CEDC4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 11:46:54 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.11214.1671191213084248692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 03:46:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=D0LdndtE;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1671191213;
  x=1702727213;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fqiBkvqYTeT6+6iq8ncMj7THtnGnDnmapIeG24caidU=;
  b=D0LdndtED0dbCZjDpniSXnzONU4q16TW/aE4uEMGU1i8XTuHH1SC/7LE
   2aTTEnXXmgjk3ilagP2m/PlSRCNIyH3Omp9ZEK6BJl8tF8RY4UFoI4Yhk
   3k3reOMK9GpSlKx+G48fjJ9ZSnL+tRll6R5k2dqXR+Ny2R1o2ee2dnomH
   PRWs2ldEkfloH03P0lTlL1MOsxA6/mWseyLqHXK4i3YI95vFTIEAk3aBi
   Qlmkwdbzx1A0tbTi2t22f4Z1f/15gl4Llcvc8Hg0NI6ifKrSbR6PlSVtL
   daywt8qsSRXGe7JJjDuj5BloftJXZ4RmFUHvcMSHpfkMzjxJbdjucGiaf
   A==;
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: v2: Y2038: Sanity checker for non-64-bit time and file functions
Date: Fri, 16 Dec 2022 12:46:48 +0100
Message-ID: <20221216114650.854563-1-olani@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 11:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174737

v2:

Renamed conf/distro/time64.conf -> conf/distro/time64.inc
Use SITEINFO_BITS to select when to apply GLIBC_64BIT_TIME_FLAGS.


I did not add _LARGEFILE to the option yet as I do not believe it is
the right place.
The _TIME_BITS=64 and _FILE_OFFSET_BITS=64 option redefine types and
functions.  The _LARGEFILE* options add new types and functions.  The
purpose of the time64.inc file is to enforce the redefinition of
time_t and other types in code that has not bothered before.  The
_LARGEFILE* options should probably only be used by code that has
explicitly chosen to use these glibc extensions, possible configured
by autoconf.

--
Ola Nilsson






