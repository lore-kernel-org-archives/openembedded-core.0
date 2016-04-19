Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 234FF60110
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 14:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3JEsAZ2001222; Tue, 19 Apr 2016 15:54:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id A9UGTvIr7waA; Tue, 19 Apr 2016 15:54:10 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3JEs8gB001218
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 19 Apr 2016 15:54:09 +0100
Message-ID: <1461077648.31320.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>,
	Hongxu Jia <hongxu.jia@windriver.com>
Date: Tue, 19 Apr 2016 15:54:08 +0100
In-Reply-To: <CALbNGRQB-BUVH6qcQxey9CYOji-z8ydVA==qi5bx-ouBVpGaWw@mail.gmail.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
	<CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
	<57149B89.2090607@windriver.com>
	<CALbNGRTgnNYhN68zcDBKrhQ==fxP9wJ7wjj8pQ5jvMEgF=DF4g@mail.gmail.com>
	<5714A30A.9000204@windriver.com>
	<CALbNGRSBJSR4xMqCOUvu2yQcG38E=1UZBehkjmFZLdrtRyfamw@mail.gmail.com>
	<5714AA1E.9020505@windriver.com>
	<CALbNGRSe6B9-QRftL54DEEKrmCjxTt91K7FXk+CUzuGxjTvf5A@mail.gmail.com>
	<5714DC35.7040206@windriver.com>
	<CAJTo0LYTcA-c99-T_Z6q9Kn=X2C9Y1kBX+D6rzHrn+eLMUcSdA@mail.gmail.com>
	<CALbNGRR0ySfXHZFgTAPGCi5sZXehjG3_vUzGobawrTW6-DOOVg@mail.gmail.com>
	<5715DF5B.5030406@windriver.com>
	<CALbNGRQB-BUVH6qcQxey9CYOji-z8ydVA==qi5bx-ouBVpGaWw@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Tue, 19 Apr 2016 14:54:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-04-19 at 16:11 +0200, Andreas Müller wrote:
> thanks a lot for your efforts. Do I understand this right: You
> suggest
> to use build sysroot (on my own risk - as I did before) and make gdb
> happy by linking sources?
> 
> Problem I see is that we have multiple package archs e.g
> ARM/ARMThumb/Machine so ${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}
> expands to multiple paths. But a script symlinking all together + set
> substitute-path might help here...
> 
> I will play around with this in the later...

I was thinking about this a bit more and there is another option
available to you which would be to pass all the debug sources into the
sysroot as hardlinks to the files in workdir, in much the same way as
we do the other sysroot files (which you don't strip).

Since those files are collected by do_package you'd probably have to
force do_populate_sysroot after do_package but such an additional class
to make these tweaks probably wouldn't be that large and would just
affect performance a bit (with the benefit of the debugging you want).

Just thinking out loud really. My big worry is all the different
codepaths we have people using, equally, you can't get performance
(disk footprint and speed) and functionality in some cases and people
do want to choose different compromises.

Cheers,

Richard


