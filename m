Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641A0EA3F26
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 08:40:03 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15624.1770712801920503564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 00:40:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RBXpWvxC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso4582635e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 00:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770712800; x=1771317600; darn=lists.openembedded.org;
        h=mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4tK5YiVESunkqVCiz4yf7DgT4xBX6rk1WRyzd6miDf4=;
        b=RBXpWvxC9vyDvOp19gn5UKxhvXDXrU+m8Gm+f+LNoQoMTfX30DBMFwIjGCftVjY6tX
         1u4IEm7/G2OzZR0xzjhwY6XJdkQCaK0mWbJ1oFKMARQ786/aWbe4ltekSEz9RHlAPx09
         99dyLHUuob0wrXAWMJKAEeFN9f4zfaawiBwxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770712800; x=1771317600;
        h=mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tK5YiVESunkqVCiz4yf7DgT4xBX6rk1WRyzd6miDf4=;
        b=VdwrwVNlWh6wHmDjyY9wd5iB7zip4f9fkopC2dPlFqH13lvFxha/p0vOMMgMUefG8P
         SvsDCdcuLAFDk2BaotOwheb0HfmtvBWbkRRymCuKo9ZelSLwLArnFLqT0/zchsaZ8AUZ
         z7yztOswGaVhrzB7KG/FbX9Bg9RUg7t+MmDiXCXRtP/ifbhkJKfZPFDEjUFgZzeRo4zZ
         ZqMLPiRE0ogFaFJ2FPbJj8Kj9D6IIlqzwJnNdWPjLQ3xm0gmFx8kKQvVp9ektD5SaEcY
         4IAanmPJvRnuKhJ5VFLOtiwSVUuoFM2Jc7UUVKpkNVnzFq+FMWEwvUi9EhIHhETwzk/1
         9C+A==
X-Forwarded-Encrypted: i=1; AJvYcCXYWCbnapz51a8sAOF2Nju3Py0w2eTRHSpoiPfOAq0hVMJFCNhjFJpikU45QkniEyfELs6Zk+VHN4tmsQx25EugPQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyt6jF9A9ieOC05cZFjzWtNi/I8EtHEXqbTC/OJ0axRV7ZrAHsO
	GisvhhGMoCvZ/yJoKfyBufvy5OnapTpIWnW+iecJZ0XP05oMswskRpR5aOWBuRtqb8LoWM2OZWB
	MwsADItM=
X-Gm-Gg: AZuq6aKtVLu60wCl6iBiOTYQTPBOXEf9eNlSCDhmeqXI1P9Jo2tInBpDlN+9vwSXnba
	LVscYNufnPUKwZ8/3KPkjTFsD1QC2cdrmnBdqdIy8Mchky4Q3xdzksBkRx587a9iMx+q9d7774M
	mjr2P/NhmWWSfAUWVxXkRRgsHoctfza7DZR8AWyFf3yWN1CbInkm3yeJAyEw40vRtO9cP2TQ9rt
	dcIgqtO9d3Rl/mB4XLQJ7F8k/J9qLoXnpKA3Q6tk41D7k1Zn5R0bWIpOZiKjUpaYTVJxbtLkjyE
	jsew1xqVcg8PDwhdbPvz8rkhroAJ61jIg5DbfesVteAc3F6VDfXYP8wotTfYMrWwT/EimMR+r98
	06wgd+ptoRz3aHvY/VI/TLQXaZCFRybTvyTSxDbK9XqVRBvFu1fp7wB7ysmzYM+GwC+UheDfi9g
	k9PyGVMvzlmDNYTaFkgD88BR/BIR4RSXJIIYRFNYlTCKt7cWtrSIXVd0sLKCSnMvt92V7vpPkbV
	k9Ta7OZkg==
X-Received: by 2002:a05:600c:5253:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-483201ee7f4mr196502175e9.15.1770712800261;
        Tue, 10 Feb 2026 00:40:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:847e:ef7e:e5c4:fa? ([2001:8b0:aba:5f3c:847e:ef7e:e5c4:fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4c4sm73440795e9.10.2026.02.10.00.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 00:39:59 -0800 (PST)
Message-ID: <9c9458ef6c32d63781cdfa8039caae30f63e1437.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC] Improving ext* sparse image generation:
 migrating from img2simg to ext4sparse for ext* filesystem
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ashishkumar.mishra@bmwtechworks.in, 
	openembedded-core@lists.openembedded.org
Date: Tue, 10 Feb 2026 08:39:58 +0000
In-Reply-To: <Tn1R.1770617538678222907.ff9l@lists.openembedded.org>
References: <Tn1R.1770617538678222907.ff9l@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="=-G/9Dqnfk6aXqnCfXSESL"
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 08:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230864

--=-G/9Dqnfk6aXqnCfXSESL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, 2026-02-08 at 22:12 -0800, AshishKumar Mishra via
lists.openembedded.org wrote:
> Hello Community Members=C2=A0 ,=C2=A0
> =C2=A0
> I would like to propose a change to how we handle sparse image
> generation for ext* file-systems in OpenEmbedded,=C2=A0
> specifically moving away from the generic img2simg tool toward the
> specialised ext2simg in the e2fsprogs [contrib/android]

Firstly, you should probably mention that image_types_sparse is in
meta-oe, not oe-core. You should therefore probably mention this on the
list where meta-oe is maintained too.

> 1) Problem
> Currently, image_types_sparse.bbclass uses img2simg for all file-
> system types.=C2=A0
> img2simg is a=C2=A0 tool that reads the raw image to find zero-filled
> blocks.=C2=A0
> For ext* file-systems, this is inefficient compared to=C2=A0 ext2simg fro=
m
> e2fsprogs [contrib/android]
> which understands the file-system structure and uses the block bitmap
> to determine sparse areas.

That seems reasonable.

> 2) History
> Previously, 'ext2simg' was bundled within android-tools (v5.1 and
> older).
> The utility has since migrated to the e2fsprogs project
> (contrib/android).
> However, upstream e2fsprogs does not provide a build system for this
> tool,
> and it requires libsparse from android-tools to compile.
> =C2=A0
> =C2=A0
> 3) Proposed Changes
> To implement this, I am looking at a cross-layer approach:
> =C2=A0
> a. meta-oe (android-tools):
> Export libsparse, libbase, and liblog headers and libraries to the
> sysroot. Currently, these are often internal to the build.
> Reorganise header installation to ${includedir}/sparse to match the
> expected include paths for e2fsprogs contrib tools.
> =C2=A0
> b. oe-core (e2fsprogs):
> Add a conditional compilation step in e2fsprogs-native to build the
> ext4sparse utility located in contrib/android/.
> This would link against the exported libsparse from android-tools-
> native.
> =C2=A0
> c. meta-oe (image_types_sparse.bbclass):
> Update CONVERSION_CMD:sparse to detect ext* types.
> Use=C2=A0 ext2simg from the e2fsprogs [contrib/android] for these types
> while falling back to img2simg for others (like f2fs).
> =C2=A0
> =C2=A0
> 4) Points for Discussion / Feasibility
> =C2=A0 =C2=A0 =C2=A0I am seeking feedback on the following:
> =C2=A0
> a. Layer Dependency:=C2=A0
> This introduces a tighter coupling between oe-core and meta-oe.=C2=A0
> Is it acceptable for e2fsprogs-native (core) to optionally depend on
> android-tools-native (meta-oe),=C2=A0
> or i can create an bbapend file in meta-oe called
> e2fsprogs_%.bbappend.=C2=A0

oe-core cannot depend on meta-oe.

The bbappend is one approach but it means e2fsprogs would rebuild
whenever a layer is added/removed and it would likely fail the yocto-
check-layer tests. It would also mean anything depending on e2fsprogs
would also rebuild and sstate would not be reused. None of this is
particularly good.

Instead, how about a separate recipe, e2fsprogs-ext4sparse which just
builds this utility?

Cheers,

Richard

--=-G/9Dqnfk6aXqnCfXSESL
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>Hi,</div><div><br></div><div>On Sun, 2026-02-08 a=
t 22:12 -0800, AshishKumar Mishra via lists.openembedded.org wrote:</div><b=
lockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf=
 solid;padding-left:1ex"><div>Hello Community Members&nbsp; ,&nbsp;</div><d=
iv>&nbsp;</div><div>I would like to propose a change to how we handle spars=
e image generation for ext* file-systems in OpenEmbedded,&nbsp;</div><div>s=
pecifically moving away from the generic img2simg tool toward the specialis=
ed ext2simg in the e2fsprogs [contrib/android]</div></blockquote><div><br><=
/div><div>Firstly, you should probably mention that image_types_sparse is i=
n meta-oe, not oe-core. You should therefore probably mention this on the l=
ist where meta-oe is maintained too.</div><div><br></div><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><div><strong>1) Problem</strong></div><div><span style=3D"white-=
space: normal;"><span style=3D"white-space: pre;"> </span>Currently, image_=
types_sparse.bbclass uses img2simg for all file-system types.&nbsp;</span><=
/div><div><span style=3D"white-space: normal;"><span style=3D"white-space: =
pre;"> </span>img2simg is a&nbsp; tool that reads the raw image to find zer=
o-filled blocks.&nbsp;</span></div><div><span style=3D"white-space: normal;=
"><span style=3D"white-space: pre;"> </span>For ext* file-systems, this is =
inefficient compared to&nbsp; ext2simg from e2fsprogs [contrib/android]</sp=
an></div><div><span style=3D"white-space: normal;"><span style=3D"white-spa=
ce: pre;"> </span>which understands the file-system structure and uses the =
block bitmap to determine sparse areas.</span></div></blockquote><div><br><=
/div><div>That seems reasonable.</div><div><br></div><blockquote type=3D"ci=
te" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:=
1ex"><div><strong>2) History</strong></div><div><span style=3D"white-space:=
 normal;"><span style=3D"white-space: pre;"> </span>Previously, 'ext2simg' =
was bundled within android-tools (v5.1 and older).</span></div><div><span s=
tyle=3D"white-space: normal;"><span style=3D"white-space: pre;"> </span>The=
 utility has since migrated to the e2fsprogs project (contrib/android).</sp=
an></div><div><span style=3D"white-space: normal;"><span style=3D"white-spa=
ce: pre;"> </span>However, upstream e2fsprogs does not provide a build syst=
em for this tool,</span></div><div><span style=3D"white-space: normal;"><sp=
an style=3D"white-space: pre;"> </span>and it requires libsparse from andro=
id-tools to compile.</span></div><div>&nbsp;</div><div>&nbsp;</div><div><st=
rong>3) Proposed Changes</strong></div><div>To implement this, I am looking=
 at a cross-layer approach:</div><div>&nbsp;</div><div><span style=3D"white=
-space: normal;"><span style=3D"white-space: pre;"> </span>a. meta-oe (andr=
oid-tools):</span></div><div><span style=3D"white-space: normal;"><span sty=
le=3D"white-space: pre;"> </span>Export libsparse, libbase, and liblog head=
ers and libraries to the sysroot. Currently, these are often internal to th=
e build.</span></div><div><span style=3D"white-space: normal;"><span style=
=3D"white-space: pre;"> </span>Reorganise header installation to ${included=
ir}/sparse to match the expected include paths for e2fsprogs contrib tools.=
</span></div><div>&nbsp;</div><div><span style=3D"white-space: normal;"><sp=
an style=3D"white-space: pre;"> </span>b. oe-core (e2fsprogs):</span></div>=
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>Add a conditional compilation step in e2fsprogs-native to build th=
e ext4sparse utility located in contrib/android/.</span></div><div><span st=
yle=3D"white-space: normal;"><span style=3D"white-space: pre;"> </span>This=
 would link against the exported libsparse from android-tools-native.</span=
></div><div>&nbsp;</div><div><span style=3D"white-space: normal;"><span sty=
le=3D"white-space: pre;"> </span>c. meta-oe (image_types_sparse.bbclass):</=
span></div><div><span style=3D"white-space: normal;"><span style=3D"white-s=
pace: pre;"> </span>Update CONVERSION_CMD:sparse to detect ext* types.</spa=
n></div><div><span style=3D"white-space: normal;"><span style=3D"white-spac=
e: pre;"> </span>Use&nbsp; ext2simg from the e2fsprogs [contrib/android] fo=
r these types while falling back to img2simg for others (like f2fs).</span>=
</div><div>&nbsp;</div><div>&nbsp;</div><div><strong>4) Points for Discussi=
on / Feasibility</strong></div><div>&nbsp; &nbsp; &nbsp;I am seeking feedba=
ck on the following:</div><div>&nbsp;</div><div><strong><span style=3D"whit=
e-space: normal;"><span style=3D"white-space: pre;"> </span>a. Layer Depend=
ency:&nbsp;</span></strong></div><div><span style=3D"white-space: normal;">=
<span style=3D"white-space: pre;"> </span>This introduces a tighter couplin=
g between oe-core and meta-oe.&nbsp;</span></div><div><span style=3D"white-=
space: normal;"><span style=3D"white-space: pre;"> </span>Is it acceptable =
for e2fsprogs-native (core) to optionally depend on android-tools-native (m=
eta-oe),&nbsp;</span></div><div><span style=3D"white-space: normal;"><span =
style=3D"white-space: pre;"> </span>or i can create an bbapend file in meta=
-oe called e2fsprogs_%.bbappend.&nbsp;</span></div></blockquote><div><br></=
div><div>oe-core cannot depend on meta-oe.</div><div><br></div><div>The bba=
ppend is one approach but it means e2fsprogs would rebuild whenever a layer=
 is added/removed and it would likely fail the yocto-check-layer tests. It =
would also mean anything depending on e2fsprogs would also rebuild and ssta=
te would not be reused. None of this is particularly good.</div><div><br></=
div><div>Instead, how about a separate recipe, e2fsprogs-ext4sparse which j=
ust builds this utility?</div><div><br></div><div>Cheers,</div><div><br></d=
iv><div>Richard</div><div><br></div><div><span></span></div></body></html>

--=-G/9Dqnfk6aXqnCfXSESL--

