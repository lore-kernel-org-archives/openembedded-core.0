Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.7739.1618496329210743276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 07:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B304pM4y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id y20-20020a1c4b140000b029011f294095d3so14705611wma.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 07:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version;
        bh=IPVw2WB7P1wisJ/CB2QcGWxAmRK5IgxJjm8K3AAuZoE=;
        b=B304pM4y5SvGa4ezigSIKyIC42RTdw1cOlRQS28IvDyV4E07eUnJJpXug3sAAg5xju
         SzLghj+CxI2wYQrbI+TyIFfSMi+7kX3sWwc6T5K5xkUuI35gHJuongKBfU4Aw6YAO5pf
         1m5iBhOFChBSiJ9+uNpbkfJFvDd65BgRYbeTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version;
        bh=IPVw2WB7P1wisJ/CB2QcGWxAmRK5IgxJjm8K3AAuZoE=;
        b=BKucrQDgCfavo4+eGmEO21ixyy+eRCxWu8nz+DYFRVgRWGWA9M86WLL8jAB2oM97U3
         3ZXsJlaj5wYzBQwvejsck3nBG60aqnZhTVWShnjjSL+xt38dZ+Fxa06DMuW/oNg/YAq6
         /eBmJSnSzEvLscqtulvaDQ8Xvb1x3gbesCG6y5/nfk6D+3p+z1SPfbE+84Euyxt09ND/
         salLzN3Unwlpvn0M4zhEGmpLUtk1qepOrtQSmBSlcRHFodLoiO/iqshD6ZebLuFqA1TN
         Z/zR3yGpC0pXnYo63A7f7tx5OaDvcWS+s4902Pm433WfrPl0h2gjpgo9YCB3wV6LB+lK
         iY3g==
X-Gm-Message-State: AOAM533I10PoEdcqU06pxbmkSxPpQugCXVej1uCUVU6fu0Umy6HQevGe
	HF8p/9f4tJ8BcBIkuaP5wwivE50P+nMSwQ==
X-Google-Smtp-Source: ABdhPJw399VOrPj9//ZPjMPQTrA3L3DTHzdScT7phbc32niLLAw5o/s952rQk7ajuexGxxnFehMY7A==
X-Received: by 2002:a7b:cf38:: with SMTP id m24mr3457784wmg.148.1618496327748;
        Thu, 15 Apr 2021 07:18:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b769:fd13:2e7b:1bdf? ([2001:8b0:aba:5f3c:b769:fd13:2e7b:1bdf])
        by smtp.gmail.com with ESMTPSA id c2sm2971519wmr.22.2021.04.15.07.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 07:18:47 -0700 (PDT)
Message-ID: <f1e774378de966fd8a8820e28bd547c07e482d07.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] base.bbclass: remove obsolete hosttools
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 15 Apr 2021 15:18:46 +0100
In-Reply-To: <20210415080103.109691-1-Qi.Chen@windriver.com>
References: <20210415080103.109691-1-Qi.Chen@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Hqc3aZGKCG+ZlXT7CIIo"

--=-Hqc3aZGKCG+ZlXT7CIIo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-04-15 at 01:01 -0700, Chen Qi wrote:
> If some tool is removed from HOSTTOOLS or HOSTTOOLS_NONFATAL, it
> will not be removed from TMPDIR/hosttools in an existing build
> directory. This is unexpected. Any tool that is not specified in
> HOSTTOOLS and HOSTTOOLS_NONFATAL should be filtered out.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/base.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 4dd01ade33..eef573d1ce 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -145,6 +145,13 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
>      if notfound and fatal:
>          bb.fatal("The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:\n  %s" % " ".join(notfound))
>  
> 
> +def clean_hosttools_dir(dest, tools):
> +    import glob
> +    desttools = glob.glob('%s/*' % dest)

I think you want os.listdir() here?

> +    for dt in desttools:
> +        if os.path.basename(dt) not in tools:
> +            os.unlink(dt)
> +

We didn't do this as it was assumed people very very rarely remove anything from HOSTTOOLS and 
if they did, they'd know what else they needed to do. This does add yet more housekeeping to every
build which I try to avoid doing for performance :/.

Cheers,

Richard 

--=-Hqc3aZGKCG+ZlXT7CIIo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Thu, 2021-04-15 at 01:01 -0700, Chen Qi wr=
ote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left=
:2px #729fcf solid;padding-left:1ex"><pre>If some tool is removed from HOST=
TOOLS or HOSTTOOLS_NONFATAL, it</pre><pre>will not be removed from TMPDIR/h=
osttools in an existing build</pre><pre>directory. This is unexpected. Any =
tool that is not specified in</pre><pre>HOSTTOOLS and HOSTTOOLS_NONFATAL sh=
ould be filtered out.</pre><pre><br></pre><pre>Signed-off-by: Chen Qi &lt;<=
a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;</pre>=
<pre>---</pre><pre>&nbsp;meta/classes/base.bbclass | 8 ++++++++</pre><pre>&=
nbsp;1 file changed, 8 insertions(+)</pre><pre><br></pre><pre>diff --git a/=
meta/classes/base.bbclass b/meta/classes/base.bbclass</pre><pre>index 4dd01=
ade33..eef573d1ce 100644</pre><pre>--- a/meta/classes/base.bbclass</pre><pr=
e>+++ b/meta/classes/base.bbclass</pre><pre>@@ -145,6 +145,13 @@ def setup_=
hosttools_dir(dest, toolsvar, d, fatal=3DTrue):</pre><pre>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;if notfound and fatal:</pre><pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;bb.fatal("The following required tools (as specifi=
ed by HOSTTOOLS) appear to be unavailable in PATH, please install them in o=
rder to proceed:\n  %s" % " ".join(notfound))</pre><pre>&nbsp;
<br></pre><pre>+def clean_hosttools_dir(dest, tools):</pre><pre>+    import=
 glob</pre><pre>+    desttools =3D glob.glob('%s/*' % dest)</pre></blockquo=
te><div><br></div><div>I think you want os.listdir() here?</div><div><br></=
div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #=
729fcf solid;padding-left:1ex"><pre>+    for dt in desttools:</pre><pre>+  =
      if os.path.basename(dt) not in tools:</pre><pre>+            os.unlin=
k(dt)</pre><pre>+</pre></blockquote><div><br></div><div>We didn't do this a=
s it was assumed people very very rarely remove anything from HOSTTOOLS and=
&nbsp;</div><div>if they did, they'd know what else they needed to do. This=
 does add yet more housekeeping to every</div><div>build which I try to avo=
id doing for performance :/.</div><div><br></div><div>Cheers,</div><div><br=
></div><div>Richard&nbsp;</div></body></html>

--=-Hqc3aZGKCG+ZlXT7CIIo--
