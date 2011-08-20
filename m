Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Qutt4-0001y6-4i
	for openembedded-core@lists.openembedded.org;
	Sun, 21 Aug 2011 00:19:30 +0200
Received: by pzk2 with SMTP id 2so9448363pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2011 15:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=8v4LOWqHgFjSJav6mPjU28XD5gPWHsg/VnfAwwCBPdY=;
	b=INGXv7HhvcSlxurZ3bODfU0qLfEWfP2/YUrHdtC9fnGRZQoacvfwZrpPdaRMZ5RrQW
	KNa9gqAbz9jzyWDL4IytmMYURBoBzP39HD//d6Pe0ZlCCkSAhkkYYNCnVN0kfObEz3JL
	q4H3D7VpoiW1a5SwkbOu/xHKWFIhzpbGnaoh0=
MIME-Version: 1.0
Received: by 10.142.43.2 with SMTP id q2mr574293wfq.94.1313878486648; Sat, 20
	Aug 2011 15:14:46 -0700 (PDT)
Received: by 10.143.39.7 with HTTP; Sat, 20 Aug 2011 15:14:46 -0700 (PDT)
In-Reply-To: <CADkTA4MYqPu+8nNpuJqOs4t+AKdiY-SHdDkXgrepPUj5uTmM2g@mail.gmail.com>
References: <cover.1313816148.git.otavio@ossystems.com.br>
	<fe4a8f56697a9915ca59d0dd4bc3f06a4072d7dc.1313816148.git.otavio@ossystems.com.br>
	<CADkTA4PBJLxUQx3PAkuzBxo+hp3B_=hPkx0rZ2_GuUvjQgDbMA@mail.gmail.com>
	<CAP9ODKq92dq0Su1RpkT3AkZb8esfe=5_VK-Gc+=xLAAtkSQqMA@mail.gmail.com>
	<CADkTA4MYqPu+8nNpuJqOs4t+AKdiY-SHdDkXgrepPUj5uTmM2g@mail.gmail.com>
Date: Sun, 21 Aug 2011 00:14:46 +0200
Message-ID: <CAAQYJAvwTn4S53VLxB6FsYU5pkUVo_-nv8rG68FZdXAk0fYhnQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] kernel.bbclass: move uboot image generation to a specific class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Aug 2011 22:19:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 8/20/11, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> On Sat, Aug 20, 2011 at 1:12 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> On Sat, Aug 20, 2011 at 02:07, Bruce Ashfield <bruce.ashfield@gmail.com>
>> wrote:
>>> These aren't equivalent. We should maintain what is already in
>>> kernel.bbclass
>>> and just move it over. If there already a uImage in the build tree,
>>> there's no
>>> need to run all the objcopy "mess" below. I found that it created useless
>>> binary
>>> blobs forme in the past.
>>
>> In this case can you take a look on this and also fix it in meta-oe?
>> The class had some differences and I do think we ought to avoid those
>> as much as possible since it only makes debugging harder.
>
> I'm not a meta-oe user. I can look into this, but it will be some time,
> since
> my plate is full with yocto 1.1 release items. I just wanted to point out
> that
> this patch isn't just a movement of code and can't go in as-is, without a
> good
> reason.


There are more differences than this:

+uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a
${UBOOT_LOADADDRESS} -
-uboot-mkimage -A ${ARCH} -O linux -T kernel -C gzip -a ${UBOOT_ENTRYPOINT}

It looks to me the line should set -a ${UBOOT_LOADADDRESS}

Regards

Andrea

>
> Cheers,
>
> Bruce
>
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
>> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


