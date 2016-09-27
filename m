Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9EBC160102
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 08:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8R88DfK010757; Tue, 27 Sep 2016 09:08:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oZnRTKwH46l3; Tue, 27 Sep 2016 09:08:13 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8R888J6010714
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Sep 2016 09:08:09 +0100
Message-ID: <1474963688.30475.18.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Liu <net147@gmail.com>, Gary Thomas <gary@mlbassoc.com>
Date: Tue, 27 Sep 2016 09:08:08 +0100
In-Reply-To: <CANwerB3Oestwc-2duHMzQHRcM2djD-3XYu-7FUObBshsNHVA2Q@mail.gmail.com>
References: <72492146-b352-1f59-1d23-26f71773d689@mlbassoc.com>
	<CANwerB3Oestwc-2duHMzQHRcM2djD-3XYu-7FUObBshsNHVA2Q@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Crazy display
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
X-List-Received-Date: Tue, 27 Sep 2016 08:08:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-09-27 at 15:50 +1000, Jonathan Liu wrote:
> Hi Gary,
> 
> On 15 September 2016 at 21:30, Gary Thomas <gary@mlbassoc.com> wrote:
> > 
> > I haven't seen this before, just thought I'd toss it out there.
> > I was doing a build (actually three in parallel in separate
> > windows on my build box) and noticed this:
> > 
> > Currently  3 running tasks (3282 of 5081)  64%
> > > 
> > > ###################################################        |
> > 0: busybox-1.24.1-r0 do_compile (pid 29425)
> > Currently  3 running tasks (3283 of 5081)  64%
> > > 
> > > ###################################################        |
> > Currently  3 running tasks (3429 of 5081)  67%
> > > 
> > > #####################################################        |
> > 0: gstreamer1.0-libav-1.8.3-r0 do_configure (pid 10393)
> > Currently  1 running tasks (3560 of 5081)  70%
> > > 
> > > ########################################################        |
> > 0: gstreamer1.0-libav-1.8.3-r0 do_compile (pid 17458)
> > Currently  3 running tasks (3601 of 5081)  70%
> > > 
> > > ########################################################        |
> > 0: gstreamer1.0-libav-1.8.3-r0 do_compile (pid 17458)
> > 1: gdk-pixbuf-2.34.0-r0 do_package_write_ipk (pid 12673)
> > 2: unifdef-native-2.11-r0 do_populate_lic (pid 24548)
> > 
> > Somehow the task tracker (that does a nice job of telling the user
> > what's going on without being overwhelming BTW) got very confused!
> > 
> > I doubt if I can every repeat this, just passing on the
> > observation!
> This seems to be related to
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10024.
> I get this issue after it prints "Child process exit status 4:
> lock_held" and then that message is overridden by the task status
> with
> the progress bar duplicated down one line.

Paul did fix some progress bar issues which were one cause of this.
pseudo is another cause and we've not gotten to the bottom of the
pseudo issue :(. It writes to the console unknown to knotty so there
isn't much we can do about it from the bitbake side, it should be a)
making it clear the messages come from psuedo and b) likely going to a
logfile, not the main console.

Cheers,

Richard


