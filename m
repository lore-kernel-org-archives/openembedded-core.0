Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC656BCF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:19:52 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id es8so628110obc.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=wuR2TfNqDUnPvi6ci3BKXZ6TVCJfkyp5cSNoR7dZQEM=;
	b=Orj5/SELDX2Gwb6T3w0ni1G3JtwLqn5Uhe5ammqKf8cbu0EEr2N8mXr7OK4zEO1kb2
	uFUWD7rNRlnrRTN+r1YLMct/Noq2KicT3/CZePIQIsIpUDF2Lre4NSkX3P2bB/T0tJ/v
	toBgMtfkWHC5Hsb1pfHj7L89QDObb0SY7O0I9s7mOIBcjsZABSv1Iu8VqqFOdO/hqnJ9
	Ct0943D0hkzutGlHQvoKTJ6e6efTtSKNxTPHhY+DIzbC9EKX9h+nEBGjOZof9pqU7n9j
	Vqu5daL+J1ii20Upd9lUX64EDbgSX+gaZPjQsRdYS0abqeVGuLrtDbp+yvHjleU2i0v1
	YV3Q==
X-Received: by 10.60.76.72 with SMTP id i8mr2942806oew.11.1377789593058; Thu,
	29 Aug 2013 08:19:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.60.44.66 with HTTP; Thu, 29 Aug 2013 08:19:33 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Thu, 29 Aug 2013 17:19:33 +0200
Message-ID: <CAGiJk9eorCAGAynkdn=eeq-NerCrx2sXpAtVS3h-R9D6tRkvpw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Busybox adduser cannot create system user "no uids left"
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
X-List-Received-Date: Thu, 29 Aug 2013 15:19:52 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

with the current master/HEAD it seems impossible to create system
users with busybox.


root@overo:~# which adduser
/usr/sbin/adduser
root@overo:~# ls -la /usr/sbin/adduser
lrwxrwxrwx    1 root     root            19 Aug 29  2013
/usr/sbin/adduser -> /bin/busybox.nosuid
root@overo:~# adduser --system --ingroup lightdm lightdm
adduser: no uids left


Normal user creation works as expected.
Content of /etc/passwd:

root:x:0:0:root:/home/root:/bin/sh
daemon:x:1:1:daemon:/usr/sbin:/bin/sh
bin:x:2:2:bin:/bin:/bin/sh
sys:x:3:3:sys:/dev:/bin/sh
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/bin/sh
man:x:6:12:man:/var/cache/man:/bin/sh
lp:x:7:7:lp:/var/spool/lpd:/bin/sh
mail:x:8:8:mail:/var/mail:/bin/sh
news:x:9:9:news:/var/spool/news:/bin/sh
uucp:x:10:10:uucp:/var/spool/uucp:/bin/sh
proxy:x:13:13:proxy:/bin:/bin/sh
www-data:x:33:33:www-data:/var/www:/bin/sh
backup:x:34:34:backup:/var/backups:/bin/sh
list:x:38:38:Mailing List Manager:/var/list:/bin/sh
irc:x:39:39:ircd:/var/run/ircd:/bin/sh
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
nobody:x:65534:65534:nobody:/nonexistent:/bin/sh
messagebus:x:999:998::/var/lib/dbus:/bin/false
xuser:x:1000:1000::/home/xuser:/bin/sh
avahi:x:998:994::/var/run/avahi-daemon:/bin/false
avahi-autoipd:x:997:993:Avahi autoip daemon:/var/run/avahi-autoipd:/bin/false
polkitd:x:996:992::/etc/polkit-1:/bin/sh


Can anyone reproduce this error, or is it a known problem?


-- 
Regards
Samuel

