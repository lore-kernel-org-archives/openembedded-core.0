Return-Path: <tasskjapp@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 165226A9A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 13:09:52 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id v20so3022225lbc.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 06:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Bqq1wPAtjSH0aACpZlemieesIQ9z5c6YuKyglJRPqtM=;
	b=WvgZwqsbTQ3kKHPGIXN3IQinrxKbNcIqkMydIBGzmuN8v6q2KZ6Isbczu36wsrADKd
	CIFWhpphYqMXoEsDaN72kMkAWFcPLKL5s55qWDFvm4MKzdcuKkmX+tyq/ZHIa7V8ukZw
	kK1QTzbw8sNd/loBJfFXVqw/Y5V9/3t4DnMlcfwSEfvVAzaydTBDtZ1psdlbbGa7QOEB
	s6S693XTWvi5oYXA2QEZbJ+etFBdbKPqUvfrhRS5bhGGCygcna1Iqwu0EkgEjWv/xLQY
	t9b3DBEx8UOfiLD38DmN8+GtXpvAWuJcUNVq0eDbrzujARUdCx7m8bJiDaAXhvO2m555
	x16Q==
X-Received: by 10.152.170.162 with SMTP id an2mr355429lac.3.1370956192969;
	Tue, 11 Jun 2013 06:09:52 -0700 (PDT)
Received: from [192.168.0.209] ([77.40.182.98])
	by mx.google.com with ESMTPSA id oi3sm7429102lbb.6.2013.06.11.06.09.50
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 06:09:51 -0700 (PDT)
Message-ID: <51B7219D.7070703@gmail.com>
Date: Tue, 11 Jun 2013 15:09:49 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <51B6EF5E.1020404@gmail.com> <20130611124350.GD7181@lpalcu-linux>
In-Reply-To: <20130611124350.GD7181@lpalcu-linux>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SDK relocation issues
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
X-List-Received-Date: Tue, 11 Jun 2013 13:09:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/11/2013 02:43 PM, Laurentiu Palcu wrote:
> Hi Tasslehoff,
>
> On Tue, Jun 11, 2013 at 11:35:26AM +0200, Tasslehoff Kjappfot wrote:
>> I compiled an SDK and extracted/installed it to my source tree
>> instead of /usr/local/. I have made /usr/local/oecore-i686 a symlink
>> to the actual location. With the latest Dylan this broke.
>>
>> Denzil:
>> ❯❯❯ ldd arm-angstrom-linux-gnueabi-gcc
>>      linux-gate.so.1 =>  (0xf771d000)
>>      libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf7544000) /usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/lib/ld-linux.so.2
>> => /lib/ld-linux.so.2 (0xf771e000)
>>
>> Dylan:
>> Original location:
>> ❯❯❯ ldd arm-angstrom-linux-gnueabi-gcc
>>      linux-gate.so.1 =>  (0xf77c4000)
>>      libc.so.6 => /home/tasslehoff/src/pdrepos01/toolchains/oecore-i686/sysroots/i686-angstromsdk-linux/usr/bin/armv7a-vfp-neon-angstrom-linux-gnueabi/./../../../lib/libc.so.6
>> (0xf7610000)
>>
>> /home/tasslehoff/src/oe/toolchains/oecore-i686/sysroots/i686-angstromsdk-linux/lib/ld-linux.so.2
>> => /lib/ld-linux.so.2 (0xf77c5000)
>
> A few things:
>   * Be careful when using ldd with SDK binaries. ldd it's just a wrapper script
>     around host's dynamic loader and it might give you wrong paths (usually to
>     the host's libraries). Luckily, in this case, the binary is relocatable and
>     has the RPATH linked in, hence the libc.so.6 location is correct. However,
>     the dynamic loader points to the host's. The correct way to print the
>     dependencies for SDK bianaries is this:
>
>     $ readelf -p .interp arm-poky-linux-gnueabi-gcc
>
>     String dump of section '.interp':
>       [     0]  /home/test/sdk_tests/sdk/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2
>
>     $ /home/test/sdk_tests/sdk/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2 --list ./arm-poky-linux-gnueabi-gcc
>          linux-vdso.so.1 (0x00007fff1a3f4000)
>          libc.so.6 => /home/test/sdk_tests/sdk/sysroots/x86_64-pokysdk-linux/usr/bin/armv5te-poky-linux-gnueabi/./../../../lib/libc.so.6 (0x00007fc102465000)
>          /home/test/sdk_tests/sdk/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2 (0x00007fc102868000)
>
>   * denzil did not support relocation and you could only install the sdk in /usr/local;
>   * AFAIK, the dynamic loader is always shipped with the SDK;
>
>>
>> If I try to run the toolchain from Dylan on a system where /home/tasslehoff/src/oe/toolchains/oecore-i686/sysroots/i686-angstromsdk-linux/lib/ld-linux.so.2
>> does not exist, it fails.
>
> Again, the DL should be available in your toolchain sysroot. I'm not aware of
> a case when the dynamic loader is not shipped with the toolchain. Did this
> happen in your case?
>

I have time for one more :)

What does it mean that the SDK is relocatable? That I can choose when I 
run the .sh where I want to install it? Is it then "bound" to that 
directory, so that every dev that wants to use the SDK have to run the 
installer on their machine? Maybe my "I can copy it wherever I want" 
interpretation of relocatable is the problem :)

The DL is shipped with the toolchain, but is looked for in the path I 
installed to when I run the .sh. If I move the entire folder, I get the 
problems.

Regards,
Tasslehoff





