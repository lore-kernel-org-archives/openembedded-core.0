Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91ABC54ED0
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 11:01:33 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.10674.1724842885026162915
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 04:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZoW+T1uN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37198a6da58so4558405f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 04:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724842883; x=1725447683; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=crnb/c1Cl3XnVcFw8/B+JiN5eXwzw3dtn3bqk8Hxw38=;
        b=ZoW+T1uNnM4HZTQXh2OtSlwJ3rr3QdZNbv8/MGtNB9CSi7grfNn47tysXVK0D8toW2
         cObifKQGGwyMokCizgK2LLbMDb4p+Cj+KBGhKZWFva4R4IsA8vB/oQbp3pTB9TQmU10A
         UeFg+T7FRQsKKZrR040JbpFaiHsgHnyYME4ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724842883; x=1725447683;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=crnb/c1Cl3XnVcFw8/B+JiN5eXwzw3dtn3bqk8Hxw38=;
        b=KMISNw8b9h7ssJ7FZc/qgdQS8+TveUbY4sCIiwby0cgyjdZprljDUNhtmmSpr5MHAZ
         CZJU8/kFtAcnpgu5BGOLYZ6N9rh3zUWEnJAsacejkIDphSCf3eSpvoTAozEPwcBmxz/S
         1DaxLR6bjD3V/vSyo9lb3tyviYzjdcruIjALXyzykfevIoTF6yDBzL7tuSc/vg4XTOcH
         XamXa00mvEFrANEasYyQjaFsn2oudzdFz83mbwmd07qaI3nyMepuypPJK7I10INP+iGz
         gz/jIQ9eHYPRJlFRQZtCbrqPK7h3L9RbtAdnXD+J6LSeJ8cZHDHON8BD1tOfYGYa8YgS
         NqLA==
X-Forwarded-Encrypted: i=1; AJvYcCXxyJDu8Obhk+s6ECmavO2SWc4XbFnWwho4qquPLMTc//lVurO+mff9/+c25HRnRdQ6pv5fYQ4p7/JZ0VyZmWNQ1Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRU8zi6JSyI5qn/7SVNEoeQRfkMkSVTz95Jpv/YZwZ0OUkBfxe
	P7szgAaLmh47YyNr+dtL1e5yKkusQIO5GWGbuYXjMfhiUzBuaYbxxZoMUbxns4g=
X-Google-Smtp-Source: AGHT+IH6CHyXoogbb+mLnbS9AHK3GT+svZ1mDWZyYm4U4TsItLh+tAevoR3fNBvu+0CWu0BZbvb0KA==
X-Received: by 2002:adf:a356:0:b0:373:61f:e80 with SMTP id ffacd0b85a97d-373118e4041mr13356573f8f.61.1724842883233;
        Wed, 28 Aug 2024 04:01:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:354e:532a:804e:264e? ([2001:8b0:aba:5f3c:354e:532a:804e:264e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373082656c6sm15396898f8f.105.2024.08.28.04.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 04:01:21 -0700 (PDT)
Message-ID: <f43cd9e44b94bfc4ccaa6b1c47b9fe3d726b2d13.camel@linuxfoundation.org>
Subject: Re: [OE-core] Unexpected behavior with class-native and
 class-target in combination with inherit(_defer)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jasper.Orschulko@iris-sensing.com, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Erik Schumacher <Erik.Schumacher@iris-sensing.com>
Date: Wed, 28 Aug 2024 12:01:20 +0100
In-Reply-To: <097dd158f1582ee370ec6ef0e5d0e7b0dda949bf.camel@iris-sensing.com>
References: 
	<097dd158f1582ee370ec6ef0e5d0e7b0dda949bf.camel@iris-sensing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 11:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203879

On Wed, 2024-08-28 at 09:40 +0000, Jasper Orschulko via lists.openembedded.=
org wrote:
> we are on the latest scarthgap and trying to use class-target to do
> target specific overrides, as described in
> https://docs.yoctoproject.org/4.0.20/singleindex.html#native.
>=20
> We tried removing python from PACKAGECONFIG:class-target. However, this
> breaks the native build of libxml2.
>=20
> This is due to the=C2=A0following inherit_defer statement not being calle=
d
> on native:
> https://github.com/yoctoproject/poky/blob/cf9d8807f80c5715daed11b5bcbb437=
8dcbcbd54/meta/recipes-core/libxml/libxml2_2.12.8.bb#L39
>=20
> We were able to reproduce this with a minimal example consisting of a
> .bb file and a .bbclass file:
>=20
>=20
> test.bb:
> ```
> SUMMARY =3D "Test"
> LICENSE =3D "CLOSED"
> LIC_FILES_CHKSUM =3D ""
>=20
> SOMEVAR =3D "foo bar"
> SOMEVAR:remove:class-target =3D "bar"
>=20
> inherit_defer ${@bb.utils.contains('SOMEVAR', 'bar', 'testclass', '',
> d)}
>=20
> do_install() {
> =C2=A0=C2=A0=C2=A0 install -d ${D}/test/
> =C2=A0=C2=A0=C2=A0 echo "Value SOMEVAR: ${SOMEVAR}" >> ${D}/test/output
> =C2=A0=C2=A0=C2=A0 echo "Value TESTCLASSVAR: ${TESTCLASSVAR}" >> ${D}/tes=
t/output
> =C2=A0=C2=A0=C2=A0 echo "SOMEVAR contains 'foo'? ${@bb.utils.contains('SO=
MEVAR',
> 'foo', 'true', 'false', d)}" >> ${D}/test/output
> =C2=A0=C2=A0=C2=A0 echo "SOMEVAR contains 'bar'? ${@bb.utils.contains('SO=
MEVAR',
> 'bar', 'true', 'false', d)}" >> ${D}/test/output
> }
>=20
> FILES:${PN} +=3D "/test/output"
>=20
> BBCLASSEXTEND =3D "native"
> ```
>=20
> and testclass.bbclass:
> ```
> TESTCLASSVAR =3D "foobar"
> ```
>=20
> We would expect that the inherit is executed for native, but not for
> target, thus the variable TESTCLASSVAR to be set in native. However,
> inherit is not called for either of them, as seen in the test output:
>=20
> Target:
> ```
> Value SOMEVAR: foo=20
> Value TESTCLASSVAR:=20
> SOMEVAR contains 'foo'? true
> SOMEVAR contains 'bar'? false
> ```
>=20
> Native:
> ```
> Value SOMEVAR: foo bar
> Value TESTCLASSVAR:
> SOMEVAR contains 'foo'? true
> SOMEVAR contains 'bar'? true
> ```
>=20
> Vice versa, when removing from class-native the inherit statement is
> always called, not only on the target as we would expect.
>=20
> Is this a known limitation or a bug?

It is a known rather annoying limitation of inherit_defer :(

The trouble is that BBCLASSEXTEND =3D "native" is also something which
happens at the end of parsing. The expansion of inherit_defer happens
before BBCLASSEXTEND. You can't really swap them since native and other
extensions are meant to happen last. This means overrides that come
from the BBCLASSEXTEND don't function when used with inherit_defer.
Something always has to come last and I'm not sure what we can do to
improve this.

I did wonder about adding logic to set the class override earlier
somehow but it is hard to make work reliably for all cases.

Cheers,

Richard


