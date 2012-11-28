Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TdfSt-0005a7-65
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 12:06:03 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so3970546pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 02:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=K692386QV9NHa8NCsJlMcFR+zknJpr1c5RVkp09RNwI=;
	b=cjXjcozdZTUJbTdBtaS4mwQKoC25Ex+RJB7u87kZLhVJRCUcuBjvgumQImjdVyhlob
	B0QKb45e+dlkINqeUjCMeTjiMiopCB62xDPMElCvRgSu6YlSyAHLDV8g1nwzjfdypBVe
	pfc3LQdHjK8MhfrEHLS5A9yNsgcaegzwzL6y2o1FRR7hvjJS1myIoBfdCmw7OD99cB5i
	2Ufk6tVuBSgh0/A6GxjJGFK1VoOtRTXBoi15etPu2X3uPbJD2bP5XVeXfRzOeX61iksy
	7yjyb+qiF8RrnR6MUDQYaVdvl3jnhi9F0O3dE1AnFd9vwR+n4WtWsfYb4hRWOdIZmS71
	DBFQ==
MIME-Version: 1.0
Received: by 10.66.88.41 with SMTP id bd9mr51297548pab.46.1354099908120; Wed,
	28 Nov 2012 02:51:48 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 28 Nov 2012 02:51:48 -0800 (PST)
In-Reply-To: <50B5763B.1040107@windriver.com>
References: <1354021038-26183-1-git-send-email-muhammad_shakeel@mentor.com>
	<CAP9ODKqLkqZ=AtU9SNVfXRFxs04LnsQEe-9iE0nsU34Yru2pnw@mail.gmail.com>
	<50B5763B.1040107@windriver.com>
Date: Wed, 28 Nov 2012 08:51:48 -0200
X-Google-Sender-Auth: l5zzdzRSJLBJUD-2TSIxUK30E8c
Message-ID: <CAP9ODKpyi3Hs1B8C9OovatGG2VxukWU9pdip2HMTMFjJn9FSJQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] udev 182: Create a symlink of /lib/udev/udevd in /sbin
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
X-List-Received-Date: Wed, 28 Nov 2012 11:06:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 28, 2012 at 12:26 AM, ChenQi <Qi.Chen@windriver.com> wrote:
> On 11/27/2012 10:15 PM, Otavio Salvador wrote:
>>
>> On Tue, Nov 27, 2012 at 10:57 AM, Shakeel, Muhammad
>> <muhammad_shakeel@mentor.com>  wrote:
>>>
>>> From: Muhammad Shakeel<muhammad_shakeel@mentor.com>
>>>
>>>  From udev 174 changelog:
>>> "The udev daemon moved to /lib/udev/udevd. Non-systemd init systems
>>> and non-dracut initramfs image generators need to change the init
>>> scripts. Alternatively the udev build needs to move udevd back to
>>> /sbin or create a symlink in /sbin, which is not done by default."
>>>
>>> Also for 64 bit architectures there exists /lib64/udev instead of
>>> /lib/udev and current init script fails to start udev.
>>>
>>> Signed-off-by: Muhammad Shakeel<muhammad_shakeel@mentor.com>
>>
>> As far as I know, all code in master now handles it properly (the
>> missing bits I sent a patch today) so why to include this symlink?
>>
> I'm not sure about this.
>
> Two things:
>
> 1) Have we ever tested udev on a target where its ${base_libdir} is
> '/lib64'?
> Apparently, if udevd is intalled under '/lib64', its init script cannot
> start udev correctly.
>
> 2) Bug#2804 is related to to udev and ${base_libdir}.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2804
> (Some packages hardcode their udev rules directory to be
> '/lib/udev/rules.d/'. So can udev find them if the ${base_libdir} is
> '/lib64'? )

It seems the right fix for it is to ensure udev is always installed in
/lib/udev/udevd (for all targets) as you propose to do for the rules.d
directory.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


