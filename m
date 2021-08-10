Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web08.192.1628624663967565723
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 12:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cybernetics.com header.s=mail header.b=LENJEq0m;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==856402cf7a3==tonyb@cybernetics.com)
X-ASG-Debug-ID: 1628624661-0fb3b001bfb7240001-7zcVdP
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id skOGVZIRu7zS8ISg; Tue, 10 Aug 2021 15:44:21 -0400 (EDT)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=C8g0maV3oQyRGdlOX5qTPs2gpmFtQlqp6UsklmiaRGc=;
	h=Content-Language:Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; b=LENJEq0mfZQqwHt
	LXdDohIVsHL80cYg3iNH87dQmaRM9E4RFpOTLfpVowL7MiYO+WNEhqPtNKZXogKWJUHvlHEy0/g8w
	jZyGyUKy+MdiREEooITnrDZqJQh5lkSBMWZCmtoKsxprCFK9MVq0Rp3JjR7SAp52rwzzoyE8cU6OH
	d8=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate Pro SMTP 6.2.14)
  with ESMTPS id 11061808; Tue, 10 Aug 2021 15:44:21 -0400
Subject: [meta-oe][master][PATCH] tcsh: fix compile error after LDFLAGS change
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
To: Khem Raj <raj.khem@gmail.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
X-ASG-Orig-Subj: [meta-oe][master][PATCH] tcsh: fix compile error after LDFLAGS change
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <randy.macleod@windriver.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <2efeecad-7ee5-126c-9271-d69fc3428c38@cybernetics.com>
 <447d4fa9-b915-4e59-0ecc-64d41c6ceee6@windriver.com>
 <22d7a9866471f53ea283caa1578fbf0b48d5e113.camel@linuxfoundation.org>
 <a0c4c23d-7437-ce14-066f-0f7f6929a987@cybernetics.com>
 <040fe5d8cd3914e7c19fc70ae6d18894b07f8073.camel@linuxfoundation.org>
 <6bb55159-9b49-3229-a15c-eee730560fb7@cybernetics.com>
 <5e21ec72-667f-6e48-eefc-843312544fe4@cybernetics.com>
 <CAMKF1srcLEBkk1udvadr1xeh8qsgr-i-8+hT_ZvL-2Nak-tsjg@mail.gmail.com>
 <17ef7e32-fe38-6e02-8d65-ee1518a38e82@cybernetics.com>
 <ead673c1-a9dd-613e-1d7c-6fcc6cf96eca@gmail.com>
 <CAMKF1soO1vifStLgeOH31-UnCUePNi9s_F1ifPsWJHR=qzkgxQ@mail.gmail.com>
From: "Tony Battersby" <tonyb@cybernetics.com>
Message-ID: <b8e3c972-3d43-1a40-1bbe-bc4fe12dd021@cybernetics.com>
Date: Tue, 10 Aug 2021 15:44:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soO1vifStLgeOH31-UnCUePNi9s_F1ifPsWJHR=qzkgxQ@mail.gmail.com>
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1628624661
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 1048
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Adding -f*-prefix-map to LDFLAGS caused the following issue when
compiling tcsh on Ubuntu 18.04:

gcc: error: unrecognized command line option =E2=80=98-fmacro-prefix-map=3D=
...=E2=80=99

Fix by using BUILD_LDFLAGS instead of LDFLAGS for gethost.

[YOCTO #14481]

Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
---

NOTE: tested only on Ubuntu 20.04.

 meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb b/meta-oe/recipe=
s-shells/tcsh/tcsh_6.22.04.bb
index ac6c6db81..c4da5cd83 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
@@ -20,7 +20,7 @@ EXTRA_OEMAKE +=3D "CC_FOR_GETHOST=3D'${BUILD_CC}'"
 inherit autotools
=20
 do_compile:prepend() {
-    oe_runmake CC_FOR_GETHOST=3D'${BUILD_CC}' CFLAGS=3D'${BUILD_CFLAGS}'=
 gethost
+    oe_runmake CC_FOR_GETHOST=3D'${BUILD_CC}' CFLAGS=3D'${BUILD_CFLAGS}'=
 LDFLAGS=3D'${BUILD_LDFLAGS}' gethost
 }
=20
 do_install:append () {
--=20
2.25.1

