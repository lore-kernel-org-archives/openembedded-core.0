Received: from mail.inango-systems.com (mail.inango-systems.com [178.238.230.57])
 by mx.groups.io with SMTP id smtpd.web08.9297.1622133026698943500
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 09:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@inango-systems.com header.s=45a440e0-d841-11e8-b985-5fcc721607e0 header.b=AGe4QvbZ;
 spf=pass (domain: inango-systems.com, ip: 178.238.230.57, mailfrom: n.papenkov@inango-systems.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-systems.com (Postfix) with ESMTP id 3E45B1080B99;
	Thu, 27 May 2021 19:30:15 +0300 (IDT)
Received: from mail.inango-systems.com ([127.0.0.1])
	by localhost (mail.inango-systems.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id JxGivRTfAo66; Thu, 27 May 2021 19:30:14 +0300 (IDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-systems.com (Postfix) with ESMTP id 534401080B8F;
	Thu, 27 May 2021 19:30:14 +0300 (IDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-systems.com 534401080B8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1622133014;
	bh=s/ObhcOo6KOhqdbFZkdnUX8rCAAQNK8ziJJtjknkg8g=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=AGe4QvbZwoVwidH7Fqw7LJWDfmNpszNalI+GuAJDJ5AzbN1FpmO+cTKnGRIehnbTC
	 2acYOfkNQnmuUiiAgzvwJI9o0ycya1LN6rGtVasJppnmodB9141a/yRHbvJKoYJWOJ
	 M6BUDIP20zRFl7DOn22OrBlAy6Spjo9vFbhKO5MtfVysnufcsu5v+R5Y5llFHOjdxa
	 Emd8tjZuGfdHyDQhtFSFKY6otrPAdHrDMDdtIfpmAC5GwHFuIDrD1D3t8vAaMVfLb2
	 pTnCy5hDx2B5dnbW6+qjYYocqHhVOYDbuNVLsV1TP+t/qBqDfdFDuDThXogu1844Lc
	 BzkMK+8iG3tBg==
X-Virus-Scanned: amavisd-new at inango-systems.com
Received: from mail.inango-systems.com ([127.0.0.1])
	by localhost (mail.inango-systems.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id An-mXrtTD-m0; Thu, 27 May 2021 19:30:14 +0300 (IDT)
Received: from mail.inango-systems.com (mail.inango-systems.com [172.17.220.3])
	by mail.inango-systems.com (Postfix) with ESMTP id 2B0DF1080056;
	Thu, 27 May 2021 19:30:14 +0300 (IDT)
Date: Thu, 27 May 2021 19:30:13 +0300 (IDT)
From: "Nikolay Papenkov" <n.papenkov@inango-systems.com>
To: openembedded-core@lists.openembedded.org
Cc: richard purdie <richard.purdie@linuxfoundation.org>, 
	Dmitry Kisil <d.kisil@inango-systems.com>
Message-ID: <1294761785.1299783.1622133013981.JavaMail.zimbra@inango-systems.com>
In-Reply-To: <20210525112326.1193-1-n.papenkov@inango-systems.com>
References: <20210525112326.1193-1-n.papenkov@inango-systems.com>
Subject: Re: [OE-core][PATCH] flex: correct license information
MIME-Version: 1.0
X-Originating-IP: [172.17.220.3]
X-Mailer: Zimbra 8.8.15_GA_3888 (ZimbraWebClient - FF88 (Linux)/8.8.15_GA_3890)
Thread-Topic: flex: correct license information
Thread-Index: wCf99I9B8qiYoiWJZoQj8aVRaSL3Og==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

LICENSE set in flex recipe looks as not correct. It is set as "BSD-2-Clause" since:
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-devtools/flex?id=fb8613fc4ed361c953087207b34b97ca23a8d4e4&h=dunfell.

however per reviewing the sources - correct LICENSE-s for flex packages should be:

LICENSE = "BSD-3-Clause & LGPL-2.0+"
LICENSE_${PN}-libfl = "BSD-3-Clause"

"BSD-3-Clause" is explained by top-level COPYING file in flex source-tree (https://github.com/westes/flex/blob/v2.6.4/COPYING#L27).
 *  text does actually include third obligation (without the actual "3" numbering)
"LGPL-2.0+" is explained by src/gettext.h (https://github.com/westes/flex/blob/v2.6.4/src/gettext.h#L4)
 *  relevant for flex but not flex-libfl package (that is not utilizing gettext)

Can this be approved and if yes - can we expect this update to be upstreamed (including dunfell branch)?

Thanks in advance,
Nikolay

----- Original Message -----
From: "Nikolay Papenkov" <n.papenkov@inango-systems.com>
To: openembedded-core@lists.openembedded.org
Cc: "richard purdie" <richard.purdie@linuxfoundation.org>, "Nikolay Papenkov" <n.papenkov@inango-systems.com>, "Dmitry Kisil" <d.kisil@inango-systems.com>
Sent: Tuesday, May 25, 2021 2:23:26 PM
Subject: [OE-core][PATCH] flex: correct license information

License-Update: Corrected license information

flex package is under two licenses:
- "BSD-3-Clause" is provided in top-level COPYING file; the license
  actually include third obligation (without the actual "3" numbering)
- "LGPL-2.0+" is explained by src/gettext.h

Signed-off-by: Dmitry Kisil <d.kisil@inango-systems.com>
---
 meta/recipes-devtools/flex/flex_2.6.4.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 1d43d2228a..54e7e01729 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -3,12 +3,14 @@ DESCRIPTION = "Flex is a fast lexical analyser generator.  Flex is a tool for ge
 lexical patterns in text."
 HOMEPAGE = "http://sourceforge.net/projects/flex/"
 SECTION = "devel"
-LICENSE = "BSD-2-Clause"
+LICENSE = "BSD-3-Clause & LGPL-2.0+"
+LICENSE_${PN}-libfl = "BSD-3-Clause"
 
 DEPENDS = "${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-native flex-native', '', d)}"
 BBCLASSEXTEND = "native nativesdk"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067 \
+                    file://src/gettext.h;beginline=1;endline=17;md5=9c05dda2f58d89b850c399cf22e1a00c"
 
 SRC_URI = "https://github.com/westes/flex/releases/download/v${PV}/flex-${PV}.tar.gz \
            file://run-ptest \
-- 
2.17.1
-- 
Nikolay Papenkov


Inango. The Service Orchestrator. 
web. [ https://mail.inango.com/inango.com | inango.com ] 
mail. [ mailto:n.papenkov@inango-systems.com | n.papenkov@inango-systems.com ] 
tel. +357 99 615176 
