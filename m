Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id E46817CDE4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 15:46:23 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id k17so8547344wrx.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 08:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=j/9FKaxOe47pAyjqEHKYYu19lED/HZ9z7Rv37DaEjXc=;
	b=br32wTzt7UEctbDKNgZBOmTaIoYaxedncHugxDDX2s487BcYihnRrBc9TfB+GCsXYS
	dfM1+OsSAtlNgNgmFalJIRueLdOcIOSmM+NleSHRJHayy3LZsa056mytzeVH+WusDaLp
	X+CxTefGX2Kv+hGRpRTceuIer5i2ihk59gl2fhbFHVKlRlhTIkBA7nxpjQ8s3DwW8JDG
	hlqJzzOIauRbnYUaBO4YU466k6k1d6o2N3pPzszvo+fvIiCkAHSkpnaENbyAd+jHvJwn
	qF7o43hUr/xFr1hcvRJXUqHbyOupNfeiomp3e2fDRmJvHQUJA5HcHE5YFNia6JmVtWc5
	KgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=j/9FKaxOe47pAyjqEHKYYu19lED/HZ9z7Rv37DaEjXc=;
	b=pINt8I3TZE5Q0LOIoJKvR2Ac+86GEg7dhSJxFToMs7iuM5jLWkfZWSjtaQYXHvXj/6
	UXa3a/98M3v/oC8iyRafZVxI26VwA88KIxYN6yPK9fbKFAShkzSHcRQIID/FbblsR3S5
	yr2uwO/UAbzyaxqdz8OauVvTECsh3KDIjSAS4e+alxGk5yZZYpJCqzLtW+3sle+s2vZM
	6l8oItshLGXe4Xs/rXyGqsNdACFA6vconKuuOYrGf8Y0kpuUg7McAasQ+2zemDc4rPIQ
	RE0zePVB4Lt+yWvkEosZ+dgoB7FKpj8vgr5jeSrk7vuwRSYoc9Hmz7HHsW+oHnHEEtPA
	7LxQ==
X-Gm-Message-State: APjAAAUZX/yVzZNB7788IiWEb1NpMw6AjX0iWFbhgjAgZ8m+dQrjlG+5
	FyVAuX01zx1qmdJoUDo8smCxpN3uVJhHcZ5G7cBW5otx
X-Google-Smtp-Source: APXvYqwhq5iSZhsh4iifs75tVpXGUrXUioS2Qdqs/EDutufdUm7G89Gp9ldWoeuvrTtwZr4d8IWpANhmw8kT9WC9wE0=
X-Received: by 2002:adf:f3ce:: with SMTP id g14mr8756801wrp.129.1554479184274; 
	Fri, 05 Apr 2019 08:46:24 -0700 (PDT)
MIME-Version: 1.0
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 5 Apr 2019 17:46:19 +0200
Message-ID: <CA+chaQd5x8FvQV9Ur1FFx04c1wEUpLoi3ZzWQ0rPhZTqyh_NUg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Robert Yang <gphone.yang@gmail.com>,
	Robert Yang <liezhi.yang@windriver.com>
Subject: allarch recipes using cmake broken (if allarch inherit is after cmake)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2019 15:46:24 -0000
Content-Type: multipart/alternative; boundary="00000000000096ebad0585ca6394"

--00000000000096ebad0585ca6394
Content-Type: text/plain; charset="UTF-8"

Hello,

since this change:
cmake.bbclass: Make it work with ccache
https://patchwork.openembedded.org/patch/157226/

the allarch recipes are no longer allarch, because they contain arch
specific CC and CXX (OECMAKE_C_COMPILER, OECMAKE_CXX_COMPILER variables).

e.g. one example where I've initially noticed this:
Hash for dependent task luna-webkit-api/luna-webkit-api.bb.do_package
changed from
0cc5f187fc5585a39c30ba78a14c0483699e155fb018e339404b679fc45d9dea to
6fdcb8b887c629d4c90c8e09d00a6eefead643f58a77b521af7abde2f354433f
  Hash for dependent task luna-webkit-api/luna-webkit-api.bb.do_install
changed from
606366f8c6ebddaf188803b3df1b4f1e2e531baddda484d34c40e5cd15c848d0 to
115a62259de2a0442c0c8249cadea44f29a21bfabe33563c7ac63ebf3023abec
    Hash for dependent task luna-webkit-api/luna-webkit-api.bb.do_compile
changed from
028e37300d041ebb67229f9b598db7e911fb4c442d6a184246b22bc579f69efb to
d76b16b6ffd6350188ebc4889b7939314a26981b8a06c976ed07d690d52f214d
      Hash for dependent task
luna-webkit-api/luna-webkit-api.bb.do_configure changed from
b64f3e5e2cf9a11d86337031322bc5a5eaea11b92889ff39edf0f545e8168eaf to
9f8713644b6400252935e026082cd6f2e9c73463e5c3aef56b132912f1c0adc9
        Hash for dependent task
luna-webkit-api/luna-webkit-api.bb.do_generate_toolchain_file changed from
d4a00eebc853da4e5401895fa8098e126110fc47d41b408853c0f6c6928a831c to
a32308b26aa0c403cee4da2a243b1b95177f3b08b9ce9eb02d64aca93064cd53
          basehash changed from
daf462705e18f12c238b2f7d6e962cb6479fbc543065ed359b47978797271645 to
7dce39db5e776de0ab31227ab50f5d6aae289777a6a75d2df7aceeb71e370249
          Variable OECMAKE_C_COMPILER value changed from
'arm-webos-linux-gnueabi-gcc' to 'aarch64-webos-linux-gcc'
          Variable OECMAKE_CXX_COMPILER value changed from
'arm-webos-linux-gnueabi-g++' to 'aarch64-webos-linux-g++'

Reverting this change resolves the issue.

Setting empty CC/CXX in allarch.bbclass fixes this issue as well, but only
when allarch is inheritted before cmake.

Actually it looks like moving allarch before cmake inherit helps even
without setting CC/CXX empty there.

Regards,

--00000000000096ebad0585ca6394
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello,<div><br></div><di=
v>since this change:</div><div>cmake.bbclass: Make it work with ccache<br><=
/div><div><a href=3D"https://patchwork.openembedded.org/patch/157226/">http=
s://patchwork.openembedded.org/patch/157226/</a><br></div><div><br></div><d=
iv>the allarch recipes are no longer allarch, because they contain arch spe=
cific CC and CXX (OECMAKE_C_COMPILER, OECMAKE_CXX_COMPILER variables).</div=
><div><br></div><div>e.g. one example where I&#39;ve initially noticed this=
:</div><div><div>Hash for dependent task luna-webkit-api/luna-webkit-api.bb=
.do_package changed from 0cc5f187fc5585a39c30ba78a14c0483699e155fb018e33940=
4b679fc45d9dea to 6fdcb8b887c629d4c90c8e09d00a6eefead643f58a77b521af7abde2f=
354433f</div><div>=C2=A0 Hash for dependent task luna-webkit-api/luna-webki=
t-api.bb.do_install changed from 606366f8c6ebddaf188803b3df1b4f1e2e531baddd=
a484d34c40e5cd15c848d0 to 115a62259de2a0442c0c8249cadea44f29a21bfabe33563c7=
ac63ebf3023abec</div><div>=C2=A0 =C2=A0 Hash for dependent task luna-webkit=
-api/luna-webkit-api.bb.do_compile changed from 028e37300d041ebb67229f9b598=
db7e911fb4c442d6a184246b22bc579f69efb to d76b16b6ffd6350188ebc4889b7939314a=
26981b8a06c976ed07d690d52f214d</div><div>=C2=A0 =C2=A0 =C2=A0 Hash for depe=
ndent task luna-webkit-api/luna-webkit-api.bb.do_configure changed from b64=
f3e5e2cf9a11d86337031322bc5a5eaea11b92889ff39edf0f545e8168eaf to 9f8713644b=
6400252935e026082cd6f2e9c73463e5c3aef56b132912f1c0adc9</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Hash for dependent task luna-webkit-api/luna-webkit-api.b=
b.do_generate_toolchain_file changed from d4a00eebc853da4e5401895fa8098e126=
110fc47d41b408853c0f6c6928a831c to a32308b26aa0c403cee4da2a243b1b95177f3b08=
b9ce9eb02d64aca93064cd53</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 baseh=
ash changed from daf462705e18f12c238b2f7d6e962cb6479fbc543065ed359b47978797=
271645 to 7dce39db5e776de0ab31227ab50f5d6aae289777a6a75d2df7aceeb71e370249<=
/div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Variable OECMAKE_C_COMPILER va=
lue changed from &#39;arm-webos-linux-gnueabi-gcc&#39; to &#39;aarch64-webo=
s-linux-gcc&#39;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Variable OECM=
AKE_CXX_COMPILER value changed from &#39;arm-webos-linux-gnueabi-g++&#39; t=
o &#39;aarch64-webos-linux-g++&#39;</div></div><div><br></div><div>Revertin=
g this change resolves the issue.</div><div><br></div><div>Setting empty CC=
/CXX in allarch.bbclass fixes this issue as well, but only when allarch is =
inheritted before cmake.</div><div><br></div><div>Actually it looks like mo=
ving allarch before cmake inherit helps even without setting CC/CXX empty t=
here.</div><div><br></div><div>Regards,</div></div></div></div>

--00000000000096ebad0585ca6394--
