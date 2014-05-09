Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (unknown [209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7F84765D55
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 02:25:34 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id uq10so596742igb.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 19:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6yjFFQjTuFtNCXBpdKUlgIwkgBBrV/AJioEh+n+63LQ=;
	b=M8tkyZ1v0QsnCScV7ZmLgjK01QO5iNjO777++yKX8y1F7iD1wQBp/bpVRrmeyjTmXV
	mQwtZggbwVPoVuEK8IR99ei+M8g2WT4yVopp2i7+5/ohY3dKdwmhxcRGC742Jct3HSZY
	PeljMTgdYKIsAATMfm60FTqE7nQWz0wNcj05ns1zrJmOnn5rQW1l9ZnlCwczSxKoq+Mb
	ajLMFceJWip829wyKH0jo2ceKpKenTIZa2TKxTuwh92hNPnb4aRLxMDHsC72j6vNOa1S
	t/oEs/Vxxabg+gF+/Gzu0AL05ZHtrfELY8lr8Cz96L+4vK//fuyQ343BJtia0Vb1rI7c
	th8Q==
X-Received: by 10.50.78.201 with SMTP id d9mr2946328igx.17.1399602335887; Thu,
	08 May 2014 19:25:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Thu, 8 May 2014 19:25:05 -0700 (PDT)
In-Reply-To: <CACS+7ZSK1P1Ev=sdFGeOz8aixRCABF_Lg1g5avbtAkZaR7xZXQ@mail.gmail.com>
References: <CACS+7ZR=mA9+=NzxF=XLXvxxgypsjzcftZQ0UVWG-0rBLk202A@mail.gmail.com>
	<5357EBAE.6040408@linux.intel.com>
	<CACS+7ZQOx4JqsRERztKBgFrNZTkQmdG0CoGN0DbdxZxWy75NDg@mail.gmail.com>
	<CAMKF1soB12wsTJ_V0+9Fq8FWX8=HWEv9iANmBvBOb4=kiKv4mQ@mail.gmail.com>
	<CACS+7ZSK1P1Ev=sdFGeOz8aixRCABF_Lg1g5avbtAkZaR7xZXQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 May 2014 19:25:05 -0700
Message-ID: <CAMKF1srBoDJd_B=5gZJgQ5npBCLtQx2tsCvhDv_q8OoQzB6xbA@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: fix tests when not using gold
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
X-List-Received-Date: Fri, 09 May 2014 02:25:38 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 28, 2014 at 2:36 PM, Dan McGregor <danismostlikely@gmail.com> wrote:
> On 23 April 2014 20:37, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Wed, Apr 23, 2014 at 9:43 AM, Dan McGregor <danismostlikely@gmail.com>
>> wrote:
>> > On 23 April 2014 10:34, Saul Wold <sgw@linux.intel.com> wrote:
>> >>
>> >> On 04/23/2014 08:01 AM, Dan McGregor wrote:
>> >>>
>> >>> From: Dan McGregor <dan.mcgregor@usask.ca>
>> >>>
>> >>> Explicitly mark the dummy function as externally visible
>> >>> so that ld can find the symbol at link time. This is needed
>> >>> when the DISTRO_FEATURE ld-is-gold is not enabled; systemd
>> >>> uses -flto anyway.
>> >>>
>> >>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>> >>> ---
>> >>>   meta/recipes-core/systemd/systemd/systemd-lto-fix.patch | 14
>> >>> ++++++++++++++
>> >>>   meta/recipes-core/systemd/systemd_211.bb                |  1 +
>> >>>   2 files changed, 15 insertions(+)
>> >>>   create mode 100644
>> >>> meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
>> >>>
>> >>> diff --git a/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
>> >>> b/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
>> >>> new file mode 100644
>> >>> index 0000000..90875e4
>> >>> --- /dev/null
>> >>> +++ b/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
>> >>
>> >>
>> >> The patch also needs an appropriate Upstream-Status and Signed-off-by
>> >> tags
>> >> here.
>> >>
>> >> Thanks
>> >>         Sau!
>> >>
>> >
>> > As I said to Ross off-list (accidentally), this patch was for Linaro GCC
>> > as
>> > of 2014-03-20. I'm going to check that it's still vald, and if so I'll
>> > send
>> > it upstream too.
>>
>> FWIW, I have updated the systemd recipe to 212+ its here
>>
>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/musl&id=f4283b924c13ea4d98b4251e11dd6a3388f195d5
>>
>> can you check if this patch is still needed there ? I use gold/arm and
>> did not run into this issue.
>>
>
> I just reran it, and it does indeed fail with meta-linaro-toolchain,
> gcc_linaro-4.8, and binutils_linaro-2.24. It builds fine with my patch.

I took another look at this patch. I think you should get feedback from systemd
community on it. It seems to me that its happening in conjunction with LTO
and there could be a back port in linaro gcc which is triggering it.
In that case sooner or later it will show up with upstream gcc as
well.

