Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 75EE26E668
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 17:56:33 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 41FA05C0E5D;
	Tue,  6 Sep 2016 19:51:21 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 06 Sep 2016 10:51:15 -0700
From: Stefan Agner <stefan@agner.ch>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <D66BCC92-E85B-4BCA-AB12-2517146B91C9@gmail.com>
References: <20160904202555.30636-1-stefan@agner.ch>
	<D66BCC92-E85B-4BCA-AB12-2517146B91C9@gmail.com>
Message-ID: <99dad66f7f15b748ecf124e12a8a0abf@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.1.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1473184281; bh=YEp5vCA+mPTWnX6dFirAXPse6HKFwrYTwAnWdOfiXTs=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=FgSZzA6GdjjfAsoD/rurkyGb4FS8oHhCmhJ9pFbc0S9ygaIoTuBSnF5Lw+jMozkLkFKELS1GbkggRK91Wh5Q/3duyLR6ZAJgytYUlYqig7EFr+CypE6ALh93VGAEiFa71OzE2ooaAB22XkpfwrIY3jfqQ+v+Q+iWJikSpyKuPxA=
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: avoid circular dependency when using initramfs
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
X-List-Received-Date: Tue, 06 Sep 2016 17:56:33 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2016-09-06 09:35, Khem Raj wrote:
>> On Sep 4, 2016, at 1:25 PM, Stefan Agner <stefan@agner.ch> wrote:
>>
>> The kernel does not automatically mount devtmpfs when using initramfs
>> based booting (even when using CONFIG_DEVTMPFS_MOUNT). If the rootfs
>> is built with USE_DEVFS=1 (which is the default), the system ends up
>> with a completely empty /dev to begin with.
>>
>> Busybox uses the first entry in inittab slightly different than
>> other init systems:
>> <id>: WARNING: This field has a non-traditional meaning for BusyBox init!
>>
>> The id field is used by BusyBox init to specify the controlling tty for
>> the specified process to run on.  The contents of this field are
>> appended to "/dev/" and used as-is.
>>
>> Since /dev/null is not there yet, Busybox throws errors instead of
>> executing the commands, and hence never mounts devtmpfs:
>> init started: BusyBox v1.24.1 (2016-09-04 11:53:14 PDT)
>> can't open /dev/null: No such file or directory
>> can't open /dev/null: No such file or directory
>> can't open /dev/null: No such file or directory
>> can't open /dev/null: No such file or directory
>> can't open /dev/null: No such file or directory
>> can't open /dev/null: No such file or directory
>> can't open /dev/null: No such file or directory
>>
>> Avoid this circular dependency by not specifing <id>. With that
>> Busybox ends up using the stdio of the init process and executes
>> the inittab just fine.
> 
> This looks good. Have you also tested it when using busybox/mdev as main
> init system just not in initramfs
> 

I remember that I tried it once with squashfs and ramdisk, which, as far
as I can recall, behaves as if it is a regular rootfs wrt devtmpfs
mount...

--
Stefan

