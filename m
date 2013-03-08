Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UE495-00008K-43
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 21:44:03 +0100
Received: by mail-ob0-f180.google.com with SMTP id ef5so1624066obb.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2013 12:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=eECpgVUMkFZWo/PcsI8tZKz0DjJ+je+ne0ERaOI9XCU=;
	b=gJh9mQdVqWWjlWjVFJZKUTYKUMFeqEKuGzlsUNgP58p1RTLYP9CqjkFLAia1QEmlo0
	xTvEkwwHJJ4qjbACERgRCxIUHjEFKUN8fg4hQiwKwzFl+1xaVF56caI5zvBKKObD1t5V
	Q8PriOZ4H3E2j4/JoIJEqIA8uT9bpbzJjYQK2iOzvPCxz5/QtpqNz6gWd9WzfN/lGCaV
	hYeXB9aYi8WnUiCl/Lp4ma/EU12jtz+AqEF/2H2HIJm7zZy6VLXKNQySZEo1cmIUuWHd
	2F/yF8fu2RepsE3ybiek7tXJXUL/qpoy/KhUYjMDxeg5hQtJ3Z+mWZwlUIOv9ryRdfVF
	+zVA==
MIME-Version: 1.0
X-Received: by 10.60.13.65 with SMTP id f1mr3035963oec.87.1362774447651; Fri,
	08 Mar 2013 12:27:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Fri, 8 Mar 2013 12:27:27 -0800 (PST)
In-Reply-To: <20130308200628.GB15481@denix.org>
References: <1362765064-27663-1-git-send-email-Chase.Maupin@ti.com>
	<CAP9ODKphM_vr-CgBbpm60tQixxepsCcMN60yGwofnhSRhrm-kA@mail.gmail.com>
	<20130308200628.GB15481@denix.org>
Date: Fri, 8 Mar 2013 17:27:27 -0300
X-Google-Sender-Auth: aJwL-O6CGczr-W_JCxqPSGCNSNk
Message-ID: <CAP9ODKreEY23jZvHhQGPa27EJdH85JzH9_QmWMNU+w7aQ9u_+A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH] soc-family: fix SOC_FAMILY override order
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Mar 2013 20:44:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 8, 2013 at 5:06 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Mar 08, 2013 at 03:52:57PM -0300, Otavio Salvador wrote:
>> On Fri, Mar 8, 2013 at 2:51 PM, Chase Maupin <Chase.Maupin@ti.com> wrote:
>> > * the current order has SOC_FAMILY settings, which are generic
>> >   settings for a group of devices, overriding the machine specific
>> >   settings.  For example:
>> >
>> >   KERNEL_DEVICETREE_ti33x = "xxxx"
>> >   KERNEL_DEVICETREE_beaglebone = "yyyy"
>> >
>> >   Should yield "yyyy" when building for the beaglebone because
>> >   that is a more specific device than ti33x.  However, without this
>> >   change the result is that the value is set to "xxxx" meaning the
>> >   more generic setting overrides the more specific setting.
>> >
>> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>>
>> Maybe while on that you could look at supporting xx:yy as SoC family?
>> like am37xx:am3715 ?
>
> Did you mean am3517? That's a slightly different variant of am35x/omap35x SoC.

Yes; sorry ... what I meant was 'am35xx:am3517'

> But if you really meant am3715 (as well as am3705, am3725 and am3730), then
> those are variants of am37x SoC, just with some subsystems, like SGX or DSP,
> being absent or present. Having those variants handled by SOC_FAMILY would be
> an overkill. Instead, we've started using MACHINE_FEATURES to distinguish
> between those variants of the same SoC, by checking for "sgx" and/or "dsp"
> flags there and pulling in needed software components accordingly.

My main concern here is that COMPATIBLE_MACHINE also parses SOC_FAMILY
however if you have two (as the 'am35xx:am3517') it is going to fail;
it could split it and parse it individually.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


