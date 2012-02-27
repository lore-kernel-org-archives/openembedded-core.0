Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1S1ofg-0007Ly-GG
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 01:42:32 +0100
Received: by obhx4 with SMTP id x4so5016482obh.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 16:34:06 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.182.75.102 as permitted sender) client-ip=10.182.75.102; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.182.75.102 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.182.75.102])
	by 10.182.75.102 with SMTP id b6mr4327634obw.9.1330302846625 (num_hops
	= 1); Sun, 26 Feb 2012 16:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=iRA7ilaFDQuEo9vWbEFzNHmfvAjXQ1Ps4cduZn+2s3E=;
	b=VOaEaKkqmE7olahFEjJw6AIy4LOdOG1Qp83WoEMK84M7BCqT8k92XTvHf8T0uKoLsZ
	mRNANmW01b0fVfp0r77jtnUDemEC4s3/qwZ5frNPQ+HwKRVDyLT7MRVMLxwVYxpE9Q8b
	uZs780l14j3dC8vJXrUeiv2Rv9rb1dZaJ1sQc=
MIME-Version: 1.0
Received: by 10.182.75.102 with SMTP id b6mr3864348obw.9.1330302846522; Sun,
	26 Feb 2012 16:34:06 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Sun, 26 Feb 2012 16:34:06 -0800 (PST)
In-Reply-To: <1330298698.31855.27.camel@ted>
References: <CAGDS+nk2zxHM05n1rKzW8q-sgOmiMCVdwRP_LvWJ-B+1_8hH5Q@mail.gmail.com>
	<1330298698.31855.27.camel@ted>
Date: Sun, 26 Feb 2012 16:34:06 -0800
Message-ID: <CAGDS+nn_wO7eZD1pHL1bY=NR5KaZsopTKRH5XDvDVwXycirTug@mail.gmail.com>
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
X-List-Received-Date: Mon, 27 Feb 2012 00:42:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Feb 26, 2012 at 3:24 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Sun, 2012-02-26 at 09:25 -0800, Steve Sakoman wrote:
>> After a pull this morning the rebuild if elfutils fails with:
>>
>> | /usr/bin/ld: cannot find -lbz2
>> | collect2: ld returned 1 exit status
>> | make[3]: *** [libdw.so] Error 1
>> | make[3]: Leaving directory
>> `/media/Work/yocto/tmp/work/i686-linux/elfutils-native-0.148-r5/elfutils-0.148/libdw'
>>
>> If I build bzip2-native and then rebuild elfutils-native all is well
>> and the build continues until the next failure (mesa-dri-glsl-native,
>> fwiw, haven't investigated that one yet).
>
> This sounds like there might be a floating dependency in elfutils on
> bzip2, if its present. We probably need to lock that down one way or
> another.
>
>> Anyone else see this, or is it just another case of my build machines
>> being in a strange state?
>
> I've seen mesa-dri-glsl-native myself and if its the same issue, this is
> something the signature changes have highlighted. It was there before,
> that change just exposed it.
>
> Basically, the problem is compile running twice. You could do it before
> with something like:
>
> bitbake mesa-dri-glsl-native
> bitbake mesa-dri-glsl-native -c compile -f
>
> We either need to fix these makefile issues or run "make clean" against
> them before rerunning make.

FWIW, I also had build failures on docbook-utils-native and libzypp.
In all cases a -c cleansstate and rebuild got me back to being
productive.  I'm on a bit of a deadline so I didn't have time to
research a proper fix for each.

The docbook-utils errors (and there were many) started with:

| jade:../../doc/docbook-utils.sgml:9:0:E: reference to entity "BOOK"
for which no system identifier could be generated
| jade:../../doc/docbook-utils.sgml:1:0: entity was defined here
| jade:../../doc/docbook-utils.sgml:9:0:E: reference to entity "BOOK"
for which no system identifier could be generated
| jade:../../doc/docbook-utils.sgml:1:0: entity was defined here
| jade:../../doc/docbook-utils.sgml:9:0:E: reference to entity "BOOK"
for which no system identifier could be generated
| jade:../../doc/docbook-utils.sgml:1:0: entity was defined here

And the libzypp error:

| /media/Work/yocto/tmp/sysroots/i686-linux/usr/bin/cmake -E
cmake_progress_report
/media/Work/yocto/tmp/work/omap3_multi-poky-linux-gnueabi/libzypp-0.0-git1+15b6c52260bbc52b3d8e585e271b67e10cc7c433-r18/git/CMakeFiles
| make[2]: *** No rule to make target
`/media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libcrypto.so',
needed by `zypp/libzypp.so.810.1.0'.  Stop.

Sorry I don't have time to dig into the issues at the moment . . .

Steve

>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


