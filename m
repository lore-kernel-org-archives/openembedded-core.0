Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2EAF8DFF7
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:26 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28271.1776378801775630678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m68Yd48P;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so731805e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378800; x=1776983600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2otvjNxhfg/FKlFkmYbnyjoFjWiNsNv0c4SQ18zkQc=;
        b=m68Yd48PgpKsdAGJchNHDnHO88SZWXQx/tpQfFzTuctureJZq4TlZSdDpVtyW6UBZu
         jrhebbxa4ESx4+Fe2ZGxGNe6LYhgw5euNGG96Zw/ywsD58JXNCaomWo+h0pUa6xltFmS
         1G9SxejCY1+KDu7rapkwvQsZgJp2HCBahqZCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378800; x=1776983600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U2otvjNxhfg/FKlFkmYbnyjoFjWiNsNv0c4SQ18zkQc=;
        b=kCrTQyB2bIR3IuxF/K1RrXBNLgzrj8SXMiTvnPqXnFZgV3sdD2NEmFdBFCHF00W3Xw
         JliRKnxrmjWQi1vLVT+d5GaAz11ad9Sa62fVogOQCGFkHdw2AbC5KCFmgWdvwWBjO5FY
         U8Dgpqvy1kXCzStoxWl7DIOol/91rsyVqe+yP2S6QcRDkrlvSS9KuvjABbMWnppOg8PF
         5KUiEa32mVd5aJEgWEr+pxbcoFRT/RP9KpvcBdbq6EeMCAFMmSqQq4a6HXmrWyA1YOLA
         tZ48CSJcGfCBlJ9Mlht5o5Sd+gGgWsG9YEj+Da7oAcFnHLskir+cUpqiV1uPwbrjLazj
         PrIg==
X-Gm-Message-State: AOJu0Yza8AGXg9YkQ1Jul4ypNnN/XVJb6dm/dfIioIjl1Rl6eLdhaX/k
	owbcbZNhUegdVSwSVF+kKF8OjTW31bSp78IEzDiXhS2W06HANMD9ShowJoH6xwaUFNYaSFkCfau
	+0QBrvlTPqLiI
X-Gm-Gg: AeBDiesSk3yR2kbHyNU+1Dz2heWfQPzHBC3VggYDLtVua2q7A8Ev3cw1g0jVFK44MKO
	9DEfXOVQs8Og3zy+c7FPXFMWkJNas8nW24y1SEXb+pZIFTmrtA6VF6dxShJEVWu+LFcRdb0v+NT
	j5iNaVsqqP41dldOQj2Dy1274Ubn1QZ7Ds8/q6s85mGTncg0SOniBAXV0eqgp/Lkeww0Vwvzp1K
	zkMyzj1vNZt6tJbDUw3+XcbWHVlcdVoNxWkpysRl0MdRrlz8814gH/qJ/ZmMqlPapTsZ9t6ZJkR
	o8Lf9YZHap2nU371VrTenNx0Qu40/NXURw/4LBnPq4V7yc4vJGjz/DbubCLZHe4VBAfa8CNPWMx
	X2pnLvCdhNKZph06sNi3RJOh9KjVbN4gkqgVwHcYYmXw9kYv5gfSuSjeRW9ZEqcfw/q5BLWdxTB
	zN1x1Ez3tLy+Xddxn/ICHiy6D6jcrBePX1osdOtOix8sYWEMuMAw1J1k5OmvpChg50EdrloEH2r
	GnII4HijFnQRQ7SDx6YbuLwvFWkU6VmxmAHig==
X-Received: by 2002:a05:600c:3110:b0:488:8c89:cfaa with SMTP id 5b1f17b1804b1-488fb73841dmr5248835e9.3.1776378799750;
        Thu, 16 Apr 2026 15:33:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 33/51] recipetool: Recognise https://git. as git urls
Date: Fri, 17 Apr 2026 00:30:16 +0200
Message-ID: <272e0ce9cb776f14166aaddeeac9d570089e298c.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235462

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If a url has git. in it, assume it is likely to be a git cloneable url
and should be treated as such.

This allows us to switch from https://git.yoctoproject.org/git/XXX urls to
the preferred https://git.yoctoproject.org/XXX form.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cedc9209e3bae0da8d61423b16c74c49a132aa63)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index ef0ba974a99..adafaba47e5 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -368,7 +368,7 @@ def supports_srcrev(uri):
 def reformat_git_uri(uri):
     '''Convert any http[s]://....git URI into git://...;protocol=http[s]'''
     checkuri = uri.split(';', 1)[0]
-    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://git(hub|lab).com/[^/]+/[^/]+/?$', checkuri):
+    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://git(hub|lab).com/[^/]+/[^/]+/?$', checkuri) or re.match(r'https?://git\..*', checkuri):
         # Appends scheme if the scheme is missing
         if not '://' in uri:
             uri = 'git://' + uri

