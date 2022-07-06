Return-Path: <mfumita@electromag.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA77C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 04:01:20 +0000 (UTC)
Subject: Re: libstdc++ honister -> kirkstone
To: openembedded-core@lists.openembedded.org
From: mfumita@electromag.com.au
X-Originating-Location: Perth, Western Australia, AU (203.59.235.95)
X-Originating-Platform: Windows Chrome 103
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 05 Jul 2022 21:01:13 -0700
References: <fbe2ba5d-f82c-ea57-a00d-4e0ff1b9586f@electromag.com.au>
In-Reply-To: <fbe2ba5d-f82c-ea57-a00d-4e0ff1b9586f@electromag.com.au>
Message-ID: <28194.1657080073438546558@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="2IOEw8Eg4E8dXqAxWOPz"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 04:01:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167687

--2IOEw8Eg4E8dXqAxWOPz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello there,

It isn't due to EOVERFLOW but make_file_type function in libstdc++-v3\src\f=
ilesystem\ops-common.h always returns file_type::unknown.
It's because _GLIBCXX_HAVE_S_ISREG isn't defined.
I found HAVE_S_ISREG at libstdc++-v3/config.h isn't set properly.

It's caused by a configure failure below to tell if S_ISREG exists on the t=
arget.
gcc/arm-emit-linux-gnueabi/11.3.0/ld: error: tmp-glibc/work/cortexa9t2hf-ne=
on-emit-linux-gnueabi/gcc-runtime/11.3.0-r0/dummylib/libstdc++.so: file is =
empty
collect2: error: ld returned 1 exit status
configure:15686: $? =3D 1

It complains dummylib/libstdc++.so is empty, configure failed then wrongly =
considered S_ISREG doesn't exist.
This seems related to the following commit.
https://github.com/openembedded/openembedded-core/commit/34b0edb0d3120c3206=
3ff7e3dd52be20d60401d5

Reverting this commit rectifies this issue but not sure what's the proper f=
ix?
Any help appreciated.

Thanks,
Mori

--2IOEw8Eg4E8dXqAxWOPz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello there,</div>
<div>&nbsp;</div>
<div>It isn't due to EOVERFLOW but make_file_type function in libstdc++-v3\=
src\filesystem\ops-common.h always returns file_type::unknown.</div>
<div>It's because _GLIBCXX_HAVE_S_ISREG isn't defined.</div>
<div>I found HAVE_S_ISREG at libstdc++-v3/config.h isn't set properly.</div=
>
<div>&nbsp;</div>
<div>It's caused by a configure failure below to tell if S_ISREG exists on =
the target.</div>
<div>gcc/arm-emit-linux-gnueabi/11.3.0/ld: error: tmp-glibc/work/cortexa9t2=
hf-neon-emit-linux-gnueabi/gcc-runtime/11.3.0-r0/dummylib/libstdc++.so: fil=
e is empty</div>
<div>collect2: error: ld returned 1 exit status</div>
<div>configure:15686: $? =3D 1</div>
<div>&nbsp;</div>
<div>It complains dummylib/libstdc++.so is empty, configure failed then wro=
ngly considered S_ISREG doesn't exist.</div>
<div>This seems related to the following commit.</div>
<div>https://github.com/openembedded/openembedded-core/commit/34b0edb0d3120=
c32063ff7e3dd52be20d60401d5</div>
<div>&nbsp;</div>
<div>Reverting this commit rectifies this issue but not sure what's the pro=
per fix?</div>
<div>Any help appreciated.&nbsp;<br /><br />Thanks,<br />Mori<br /><br /></=
div>

--2IOEw8Eg4E8dXqAxWOPz--

