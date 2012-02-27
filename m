Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1S1uEB-0007GJ-3X
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 07:38:31 +0100
Received: by obhx4 with SMTP id x4so5233548obh.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 22:30:04 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.182.1.104 as permitted sender) client-ip=10.182.1.104; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.182.1.104 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.182.1.104])
	by 10.182.1.104 with SMTP id 8mr4653388obl.19.1330324204735 (num_hops =
	1); Sun, 26 Feb 2012 22:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=9t5ZRM7GVzkKeeIF/KLK3s0CniXllXJkaTHXJmNKhs4=;
	b=Jx9um1fLwba4OgYT6b9vCzTkJPQ7rc4ZW1QYuDvhbybWPOvFVYipQZAtPx2hb0/dMh
	WQg/KteVzTIZqSGEdnTzxWyYFSxzlZjQrc7yQTVedyBpvTeIEgm2+oVwsnXeFKBXMlTA
	p/deQoBtw1T+RrJaev6eeo1E2fr4AfDoOSJaM=
MIME-Version: 1.0
Received: by 10.182.1.104 with SMTP id 8mr4161788obl.19.1330324204642; Sun, 26
	Feb 2012 22:30:04 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Sun, 26 Feb 2012 22:30:04 -0800 (PST)
In-Reply-To: <CAGDS+nn_wO7eZD1pHL1bY=NR5KaZsopTKRH5XDvDVwXycirTug@mail.gmail.com>
References: <CAGDS+nk2zxHM05n1rKzW8q-sgOmiMCVdwRP_LvWJ-B+1_8hH5Q@mail.gmail.com>
	<1330298698.31855.27.camel@ted>
	<CAGDS+nn_wO7eZD1pHL1bY=NR5KaZsopTKRH5XDvDVwXycirTug@mail.gmail.com>
Date: Sun, 26 Feb 2012 22:30:04 -0800
Message-ID: <CAGDS+n==y3SuLQ8cEBxerAjVyo4d9kf6qgBcQpfAd0n3iL82ew@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: elfutils - missing dependency on bzip2?
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
X-List-Received-Date: Mon, 27 Feb 2012 06:38:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 26, 2012 at 4:34 PM, Steve Sakoman <sakoman@gmail.com> wrote:
> On Sun, Feb 26, 2012 at 3:24 PM, Richard Purdie <rpurdie@rpsys.net> wrote=
:
>> On Sun, 2012-02-26 at 09:25 -0800, Steve Sakoman wrote:
>>> After a pull this morning the rebuild if elfutils fails with:
>>>
>>> | /usr/bin/ld: cannot find -lbz2
>>> | collect2: ld returned 1 exit status
>>> | make[3]: *** [libdw.so] Error 1
>>> | make[3]: Leaving directory
>>> `/media/Work/yocto/tmp/work/i686-linux/elfutils-native-0.148-r5/elfutil=
s-0.148/libdw'
>>>
>>> If I build bzip2-native and then rebuild elfutils-native all is well
>>> and the build continues until the next failure (mesa-dri-glsl-native,
>>> fwiw, haven't investigated that one yet).
>>
>> This sounds like there might be a floating dependency in elfutils on
>> bzip2, if its present. We probably need to lock that down one way or
>> another.
>>
>>> Anyone else see this, or is it just another case of my build machines
>>> being in a strange state?
>>
>> I've seen mesa-dri-glsl-native myself and if its the same issue, this is
>> something the signature changes have highlighted. It was there before,
>> that change just exposed it.
>>
>> Basically, the problem is compile running twice. You could do it before
>> with something like:
>>
>> bitbake mesa-dri-glsl-native
>> bitbake mesa-dri-glsl-native -c compile -f
>>
>> We either need to fix these makefile issues or run "make clean" against
>> them before rerunning make.
>
> FWIW, I also had build failures on docbook-utils-native and libzypp.
> In all cases a -c cleansstate and rebuild got me back to being
> productive. =A0I'm on a bit of a deadline so I didn't have time to
> research a proper fix for each.
>
> The docbook-utils errors (and there were many) started with:
>
> | jade:../../doc/docbook-utils.sgml:9:0:E: reference to entity "BOOK"
> for which no system identifier could be generated
> | jade:../../doc/docbook-utils.sgml:1:0: entity was defined here
> | jade:../../doc/docbook-utils.sgml:9:0:E: reference to entity "BOOK"
> for which no system identifier could be generated
> | jade:../../doc/docbook-utils.sgml:1:0: entity was defined here
> | jade:../../doc/docbook-utils.sgml:9:0:E: reference to entity "BOOK"
> for which no system identifier could be generated
> | jade:../../doc/docbook-utils.sgml:1:0: entity was defined here
>
> And the libzypp error:
>
> | /media/Work/yocto/tmp/sysroots/i686-linux/usr/bin/cmake -E
> cmake_progress_report
> /media/Work/yocto/tmp/work/omap3_multi-poky-linux-gnueabi/libzypp-0.0-git=
1+15b6c52260bbc52b3d8e585e271b67e10cc7c433-r18/git/CMakeFiles
> | make[2]: *** No rule to make target
> `/media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libcrypto.so',
> needed by `zypp/libzypp.so.810.1.0'. =A0Stop.
>
> Sorry I don't have time to dig into the issues at the moment . . .

Yet another FWIW - with another more "beefy" image the following
failures occurred (both fixed with -c cleansstate and rebuild):

font-util:

| cp: cannot stat
`/media/Work/yocto/tmp/sysroots/omap3-multi/usr/share/aclocal/./audiofile.m=
4':
No such file or directory
NOTE: package font-util-1.2.0-r2.2: task do_configure: Failed
ERROR: Task 3303
(/home/sakoman/source/yocto/poky/meta/recipes-graphics/xorg-font/font-util_=
1.2.0.bb,
do_configure) failed with exit code '1'

gcc:

ERROR: This autoconf log indicates errors, it looked at host include
and/or library paths while determining system capabilities.
Rerun configure task after fixing this. The path was
'/media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/gcc-4.6.2+sv=
nr181430-r27/gcc-4_6-branch/build.arm-poky-linux-gnueabi.arm-poky-linux-gnu=
eabi/gcc'
ERROR: Function failed: do_qa_configure
ERROR: Logfile of failure stored in:
/media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/gcc-4.6.2+svn=
r181430-r27/temp/log.do_configure.27718
NOTE: package gcc-4.6.2+svnr181430-r27: task do_configure: Failed

No time to debug tonight, but thought I would mention them in case
others run into them too.

Steve


