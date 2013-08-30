Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C84B46BBDA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 02:16:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7U2GA9P018493
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 19:16:10 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 29 Aug 2013 19:16:10 -0700
Message-ID: <52200080.4010401@windriver.com>
Date: Fri, 30 Aug 2013 10:16:32 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAGiJk9eorCAGAynkdn=eeq-NerCrx2sXpAtVS3h-R9D6tRkvpw@mail.gmail.com>
In-Reply-To: <CAGiJk9eorCAGAynkdn=eeq-NerCrx2sXpAtVS3h-R9D6tRkvpw@mail.gmail.com>
X-Originating-IP: [128.224.162.233]
Subject: Re: Busybox adduser cannot create system user "no uids left"
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
X-List-Received-Date: Fri, 30 Aug 2013 02:16:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/29/2013 11:19 PM, Samuel Stirtzel wrote:
> Hi,
>
> with the current master/HEAD it seems impossible to create system
> users with busybox.
>
>
> root@overo:~# which adduser
> /usr/sbin/adduser
> root@overo:~# ls -la /usr/sbin/adduser
> lrwxrwxrwx    1 root     root            19 Aug 29  2013
> /usr/sbin/adduser -> /bin/busybox.nosuid
> root@overo:~# adduser --system --ingroup lightdm lightdm
> adduser: no uids left
>
>
> Normal user creation works as expected.
> Content of /etc/passwd:
>
> root:x:0:0:root:/home/root:/bin/sh
> daemon:x:1:1:daemon:/usr/sbin:/bin/sh
> bin:x:2:2:bin:/bin:/bin/sh
> sys:x:3:3:sys:/dev:/bin/sh
> sync:x:4:65534:sync:/bin:/bin/sync
> games:x:5:60:games:/usr/games:/bin/sh
> man:x:6:12:man:/var/cache/man:/bin/sh
> lp:x:7:7:lp:/var/spool/lpd:/bin/sh
> mail:x:8:8:mail:/var/mail:/bin/sh
> news:x:9:9:news:/var/spool/news:/bin/sh
> uucp:x:10:10:uucp:/var/spool/uucp:/bin/sh
> proxy:x:13:13:proxy:/bin:/bin/sh
> www-data:x:33:33:www-data:/var/www:/bin/sh
> backup:x:34:34:backup:/var/backups:/bin/sh
> list:x:38:38:Mailing List Manager:/var/list:/bin/sh
> irc:x:39:39:ircd:/var/run/ircd:/bin/sh
> gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
> nobody:x:65534:65534:nobody:/nonexistent:/bin/sh
> messagebus:x:999:998::/var/lib/dbus:/bin/false
> xuser:x:1000:1000::/home/xuser:/bin/sh
> avahi:x:998:994::/var/run/avahi-daemon:/bin/false
> avahi-autoipd:x:997:993:Avahi autoip daemon:/var/run/avahi-autoipd:/bin/false
> polkitd:x:996:992::/etc/polkit-1:/bin/sh
>
>
> Can anyone reproduce this error, or is it a known problem?
>
>

That's because CONFIG_SYSTEM_LAST_ID is set to 0 in defconfig.
I'll send out a patch to fix it.

Best Regards,
Chen Qi

