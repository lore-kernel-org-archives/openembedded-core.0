Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 32B2273126
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 13:09:46 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3PD9euT024978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 25 Apr 2017 14:09:41 +0100
Message-ID: <1493125780.19076.132.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Apr 2017 14:09:40 +0100
In-Reply-To: <CADkTA4M1m5RLNXyRjyyybD+jNzZbQqkrW+SDtjHu3dP28rb-aA@mail.gmail.com>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<bd7ec72b-fe78-65bd-7d25-65e51a0aa30e@gmail.com>
	<CADkTA4MQ0CToP1h_s5muJt8v-bNuCr9wtD4t+sfq9ThsZZ-AWg@mail.gmail.com>
	<CADkTA4M6OS+sxsueSzdokxuo+AaTTjYrir0uPPazWsMP5dpxFg@mail.gmail.com>
	<CADkTA4P43BsLYpdDR0r7eAGkEc97hB-pQyf431-Nrtb8YUOUeg@mail.gmail.com>
	<CA+chaQeT4kDPVi4TvUaUuHzfVdDAuEtOqOMByi=vb6Onri=nqA@mail.gmail.com>
	<CADkTA4Nm71DESZodfrGKH1bqLT0o2MSn7nmgcFtkLJu57kk_=A@mail.gmail.com>
	<CADkTA4PGVyJ+b2S_77yJS6f0f3osM-yYonE55Khjk-k0oF-j-Q@mail.gmail.com>
	<1493069228.19076.121.camel@linuxfoundation.org>
	<CADkTA4M1m5RLNXyRjyyybD+jNzZbQqkrW+SDtjHu3dP28rb-aA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 25 Apr 2017 14:09:41 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto.do_validate_branches failing since last oe-core update
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
X-List-Received-Date: Tue, 25 Apr 2017 13:09:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-04-24 at 21:06 -0400, Bruce Ashfield wrote:
> On Mon, Apr 24, 2017 at 5:27 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2017-04-24 at 15:56 -0400, Bruce Ashfield wrote:
> > >
> > >
> > > On Mon, Apr 24, 2017 at 9:54 AM, Bruce Ashfield <bruce.ashfield@g
> > mail
> > > .com> wrote:
> > > >
> > > >
> > > > On Mon, Apr 24, 2017 at 9:39 AM, Martin Jansa <martin.jansa@gma
> > il.c
> > > > om> wrote:
> > 
> > >
> > > Richard/Ross: are you seeing this same thing on the autobuilder ?
> > >
> > > There's some incantation or config that I'm missing, I assume
> > this is
> > > a straight qemux86 config
> > > with a bitbake of something like core-image-minimal ?
> > 
> > We're not seeing this on the autobuilders. I do suspect something
> > in
> > the handling of extra patches or cfg fragments from SRC_URI if I
> > had to
> > guess. That certainly was the trigger last time I saw this.
> Yah, that's the kicker, I'm still carrying your patch for binfmt_elf,
> and I added two of my own
> + config fragments, and I can't trigger anything.

I managed to reproduce breakage. With master and my separate patch in
SRC_URI:

$ bitbake linux-yocto
$ bitbake linux-yocto -c kernel_checkout -f
$ bitbake linux-yocto

ERROR: linux-yocto-4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_validate_branches: Function failed: do_validate_branches (log file is located at /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/linux-yocto/4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.116726)
ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/linux-yocto/4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.116726
Log data follows:
| DEBUG: Executing shell function do_validate_branches
| HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
| 1493125671.284715: mkdir: cannot create directory ‘.’: File exists
| 1493125671.370592:
| 1493125671.3742917: [ERROR] Can't find patch dir at ./patches/standard/base
| 1493125671.3742917: usage: kgit s2q
| 1493125671.3743172: WARNING: exit code 1 from a shell command.
| 1493125671.3745801: ERROR: Function failed: do_validate_branches (log file is located at /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/linux-yocto/4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.116726)

Cheers,

Richard




