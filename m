Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4A3EC731F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 22:14:21 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id r144so118104wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 14:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U4JBFaIfRt/FJBwk/fEq5C1//mZ2vklxbnZlc96X2/k=;
	b=ah71mQKC37eYJTFHsC2z2s/MbnWjn3Bmo7JoBny76Bup1KrmX8uXWTISZ5zv6qon4b
	krGr2V9lfLkiIVCPQRdKuD+zJHY/xSyqooszRFRm5Etm9NV3MiMujht2Y9H2oFddOMsN
	5YKzAD0TioIksWdor/R+c2iRiHKTsLDAl4epueyA0s2517l38WlCQHTBPDoLJIC77rcH
	pSdZJw0Cs1GHHp5daikxAhUJy+eehyWpriawMYJJe0Ra0iuhbIa/1cu1ag5BiTD82Egm
	+Zn14f61GZPWQb8nZWp2cikzWGSKdPs3XGWmjCjFeXnrsaCn4sCeG//tCnZ7yMoeBSXW
	tvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U4JBFaIfRt/FJBwk/fEq5C1//mZ2vklxbnZlc96X2/k=;
	b=q7XOx2r+xqgQdPYbzM7tNRT1kP5s0vyEq12+m1C8ebPmsc2sa/p3kYi4kuAL6sejNO
	cxaKZJowmRbaTs280TpNS+XDQS/qcaimxe0VNHJ+MtI6qE4NEIKId1AAP7qHLGRQZoma
	dEX4kSF0xMlXuDuckpU48hbuz929VPGl7OBLZSSsRm8X2aucJ+dcAuiCfCGqVkbPeWJy
	juokK4+zPzquaJ1yFVeMKZkWpDW+wJU/1yoSQ28CPXZdVnRE+H5LA8dDwId9XskCIN4s
	wrzS1cPAbh5dt2nnJUd6x7orJoc+1ief4U9lsS4r+ypqiCJFHbi8w1mZbqQloyaSyQqS
	HvXg==
X-Gm-Message-State: AIkVDXL+QD+pWlt8USBYEv03gYNWaPQ5txHqjsOUohrqlLAmned+FkdVQGQdUZda/srMyZ/1N6hDQhUa4nOL/g==
X-Received: by 10.223.160.43 with SMTP id k40mr34610811wrk.24.1485296062089;
	Tue, 24 Jan 2017 14:14:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.52.78 with HTTP; Tue, 24 Jan 2017 14:14:01 -0800 (PST)
In-Reply-To: <1485295727.30673.69.camel@linuxfoundation.org>
References: <6e2081903352fbfbc818384ce44dc58c3da507e3.1485265775.git.maciej.borzecki@rndity.com>
	<5ac6e942-a4af-b333-b8f2-45655548915d@gmail.com>
	<1485295727.30673.69.camel@linuxfoundation.org>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Tue, 24 Jan 2017 23:14:01 +0100
Message-ID: <CAD4b0_JP3k=M8wyQZ5P=9oSfNEQkN2-Pjq2_j2g7xUvFTg_TRw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] staging: fix logic of guessing dependency manifest file in extend_recipe_sysroot
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
X-List-Received-Date: Tue, 24 Jan 2017 22:14:22 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 24, 2017 at 11:08 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2017-01-24 at 14:05 -0800, Khem Raj wrote:
>>
>> On 1/24/17 5:50 AM, Maciej Borzecki wrote:
>> >
>> > Recipe sysroots introduced a change where dependencies ending with
>> > "-cross" also
>> > count as native tools and (see setscene_depvalid() for details).
>> >
>> > The same logic was missing from extend_recipe_sysroot(), hence for
>> > depency named
>> > `go-cross` the manifest file would default to
>> > `manifest-allarch-go-cross.populate_sysroot`, while the correct
>> > name is
>> > `manifest-x86_64_arm-go-cross.populate_sysroot`
>> >
>> > Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
>> > ---
>> >  meta/classes/staging.bbclass | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/classes/staging.bbclass
>> > b/meta/classes/staging.bbclass
>> > index
>> > fc387eaf4bb52971e111ae7deac7d7d6fc389337..efea450e4f73661366d0929d5
>> > c39e42bfe9f8e8b 100644
>> > --- a/meta/classes/staging.bbclass
>> > +++ b/meta/classes/staging.bbclass
>> > @@ -521,7 +521,7 @@ python extend_recipe_sysroot() {
>> >              native = True
>> >          elif c.startswith("nativesdk-"):
>> >              manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-
>> > ${SDK_ARCH}_${SDK_OS}-%s.populate_sysroot" % c)
>> > -        elif "-cross-" in c:
>> > +        elif "-cross-" in c or c.endswith("-cross"):
>> Perhaps you can change the go cross recipe to use something like
>>
>> PN = "go-cross-${TARGET_ARCH}"
>>
>> >
>> >              manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-
>> > ${BUILD_ARCH}_${TARGET_ARCH}-%s.populate_sysroot" % c)
>> >              native = True
>> >          elif "-crosssdk" in c:
>> >
>
> FWIW the patch as it stands is going to cause problems since for
> example qemuwrapper-cross doesn't inherit cross.bbclass (nor should it)
> and will fail the manifest tests if we change it to include *-cross :(
>

Hmm I was misled by
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/sstate.bbclass#n924

Khem's suggestion makes more sense though, I'll try to get it fixed in
oe-meta-go instead.

Cheers,
-- 
Maciej Borzecki
RnDity

