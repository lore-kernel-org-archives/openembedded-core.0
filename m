Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF68ACDB471
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 21:24:52 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31686.1782249884574152960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 14:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=d82MRU7T;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso1883655e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 14:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782249883; x=1782854683; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nufUVA9TMiJq2WkV85yZ+jIZowW5H3tBr+bJJUZSkUQ=;
        b=d82MRU7Ts6uWBU+zcwXLfL9jziFJPhPzMIDE5pyqXAE9uV1xjEkrL6oNvPOo6zz/Yf
         NiGMRrr8uvH2mGM8EcskjRnrsbz2q+6SJGi52W8eJrkrLQ8qQWucfw/o075VbEDu+wgi
         NjvxT86r+o2/jd5/pBPUDokImB1qsrO9mPZe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782249883; x=1782854683;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nufUVA9TMiJq2WkV85yZ+jIZowW5H3tBr+bJJUZSkUQ=;
        b=RnPt8t3jn0ukJ0Gs767lfE9ygjlRWXLuxsF9gzwFaHOPamPLhM3kecJgL0AFGJo3k0
         qqqkB7wh2cf+iv4PbPaUlOhg31S8k0TXaFIrIs1Sd4RMVvpvG+fs9lLpVrzPM2D8nL5e
         8C2CGsJICGfD+u4yl10OR2xrQ1NgrR/ujd1yeQ0V2yXldnjwGZqR+fKNmMolN/u2Faw0
         7iOageZt3HaQs5V/lKacDnED9E2Jr/0XCrPSEKh51pKaAAruIF+dUbwW/N9kdaafpemf
         RkkLQtKpN4Xw5r7KTBt9i3cOCKEGZFQGvG0FrhvQkjk9UOTcNOWtku4MvWphu+5dDRpe
         qEyg==
X-Forwarded-Encrypted: i=1; AFNElJ/4eVT1cH+5CjbdHgg/0a3LBt93I5v3htz1hR8sYNyDG2l6kO7pXMRwGdxmszVAKkQbN5rbAVqnL2OTYfFvtgQ/6Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzRV6iRRul0WbPJvcoXhZ52DrE+7JIAfNAi7bNxQKpVh3i32uJB
	4neoDKpYG+LSKlDNW5n40ZBIGCmgxtobi2dzu4GuO4mPdHXREzQT6JA1O0+2wGQsrMc=
X-Gm-Gg: AfdE7cll50Gf5UsWaDxCa/Jf2nQRA+M82GkP5OEfmnKsN+kggfapAMk627BofLCznh6
	mBSSVzR2eKExq6+RQxMwXKiZ3VwTlS7S7hMWBPhqVEQW0T2o9R60skjtZRmJo6hzi5z1vzrSy0N
	YdSN8ReyoA2VE39+veXUzPrfoaTLUlncGV354n2/j5EpB/oBIUCfV97b53EGnojOG/C1Hl/O6l7
	FH+3RfR/G2KMHhNg7ia7JPfiK5PPfmPeh8/3XC6eRlZe2tgzRGLLZ3mLA5lO+VPfMG5KlCckFjw
	W5sH78Ek3xvPPLimqQO1niZEFuThhUfuec+1dsUDZy8i2q+FZ2yoyueDkllp2BoCYiltMzVKCBe
	1OrKvAIXCPeEjTJoU4jpVUb8FwGjOYhE91TjSLpNQkMyQrJsNJ92yzxm/KY8UWXhM4z03pt6rjF
	JWqrSbWUpktCHjzt6dGnk9H2oK9mrFrkW1BKVCNMi4qLc1vJanIc/ffBgCHZ6LM96JVQWJW1w0J
	IEN
X-Received: by 2002:a05:600c:34d2:b0:490:b115:e03f with SMTP id 5b1f17b1804b1-49249083bb5mr245249705e9.8.1782249882489;
        Tue, 23 Jun 2026 14:24:42 -0700 (PDT)
Received: from localhost (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee018e8sm535974f8f.11.2026.06.23.14.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 14:24:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 23:24:41 +0200
Message-Id: <DJGQUSMET3EE.3CPQM4DH7D357@smile.fr>
To: <jaipaul.cheernam@est.tech>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH v2] curl: fix CVE-2026-5773 - wrong
 reuse of SMB connection
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260623120850.29881-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260623120850.29881-1-jaipaul.cheernam@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 21:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239420

Hello,

On Tue Jun 23, 2026 at 2:08 PM CEST, Jaipaul Cheernam via lists.openembedde=
d.org wrote:
> Remove PROTOPT_CONN_REUSE from SMB handler flags to prevent
> connection pooling. Without this, a second SMB request to the same
> host reuses a connection authenticated for a different share.

In the commit message, you should justify why the patch you trying to
merge does indeed fix the CVE. You can use NVD, Debian security tracker
or upstream as easy/natural reference (but other may be accepted). In
this case, all 3 point to your patch so you can choose. You can look at
other CVE fixing patches to get examples.

>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---


>  .../curl/curl/CVE-2026-5773.patch             | 44 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-5773.patch
> new file mode 100644
> index 0000000000..c2984de5ff
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
> @@ -0,0 +1,44 @@
> +From 74a169575d6412dc0ff532acdf94de35a6c2a571 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Sun, 5 Apr 2026 18:23:35 +0200
> +Subject: [PATCH] smb: disable connection reuse
> +
> +Connections should only be reused when using the same "share" (and
> +perhaps some additional conditions), but instead of fixing this flaw,
> +this change completely disables connection reuse for SMB.
> +
> +Reported-by: Osama Hamad
> +Closes #21238
> +
> +Signed-off-by: Daniel Stenberg <daniel@haxx.se>
> +
> +CVE: CVE-2026-5773
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/74a169575=
d6412dc0ff532acdf94de35a6c2a571]
> +
> +(cherry picked from commit 74a169575d6412dc0ff532acdf94de35a6c2a571)
    ^ that "cherry picked" line has no use here. You can remove it.

This patch is a little different from the upstream patch:
* Not the same file patched: please add a note explaining the changes
  and why you did them.
* Also, the patch message was edited: we don't usualy do this: If you
  need to add info/context keep them in a note section you add to the
  patch message. e.g between Upstream-Status and your Signed-off-by.


With that fixed, ht epatch should be good to go, thanks!

> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> +---
> + lib/smb.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/smb.c b/lib/smb.c
> +index ccd4f3f69d..2a9f08388f 100644
> +--- a/lib/smb.c
> ++++ b/lib/smb.c
> +@@ -1242,7 +1242,7 @@
> + #endif
> +   CURLPROTO_SMB,                        /* protocol */
> +   CURLPROTO_SMB,                        /* family */
> +-  PROTOPT_CONN_REUSE,                   /* flags */
> ++  PROTOPT_NONE,                         /* flags */
> +   PORT_SMB,                             /* defport */
> + };
> +=20
> +@@ -1259,7 +1259,7 @@
> + #endif
> +   CURLPROTO_SMBS,                       /* protocol */
> +   CURLPROTO_SMB,                        /* family */
> +-  PROTOPT_SSL | PROTOPT_CONN_REUSE,     /* flags */
> ++  PROTOPT_SSL,                          /* flags */
> +   PORT_SMBS,                            /* defport */
> + };
> diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-supp=
ort/curl/curl_8.19.0.bb
> index d58b774011..3326f478b5 100644
> --- a/meta/recipes-support/curl/curl_8.19.0.bb
> +++ b/meta/recipes-support/curl/curl_8.19.0.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D " \
>      file://disable-tests \
>      file://no-test-timeout.patch \
>      file://CVE-2026-6276.patch \
> +    file://CVE-2026-5773.patch \
>      file://mbedtls.patch \
>  "
> =20


--=20
Yoann Congal
Smile ECS


