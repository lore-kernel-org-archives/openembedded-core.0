Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8337799C
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 15:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2KFHMWa029858; Mon, 20 Mar 2017 15:17:22 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Shu8E-tU8Jsb; Mon, 20 Mar 2017 15:17:22 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2KFHJ8b029854
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 20 Mar 2017 15:17:20 GMT
Message-ID: <1490023039.13980.142.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Kristian Amlie <kristian.amlie@mender.io>
Date: Mon, 20 Mar 2017 15:17:19 +0000
In-Reply-To: <CAMKF1sp6C9qqzt1azPQwOpxySj34_KifVosn5aSp2bzDjfoS6w@mail.gmail.com>
References: <7780ce1c-7e26-0cac-9813-ec713251c7b9@mender.io>
	<CAMKF1sp6C9qqzt1azPQwOpxySj34_KifVosn5aSp2bzDjfoS6w@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: go-bootstrap / go-native conflict during do_rootfs
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
X-List-Received-Date: Mon, 20 Mar 2017 15:17:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-03-20 at 07:49 -0700, Khem Raj wrote:
> On Mon, Mar 20, 2017 at 6:47 AM, Kristian Amlie
> <kristian.amlie@mender.io> wrote:
> > 
> > --------------------------------------------------
> > 
> > Additionally, in the logs I found these two snippets:
> > 
> > --------------------------------------------------
> > Considering setscene task: ['go-native', 'do_populate_sysroot']
> >   considering dependency: ['go-native', 'do_populate_sysroot']
> >   considering dependency: ['mender-artifact-native',
> > 'do_populate_sysroot']
> > Adding dependency on go-native
> > ...
> > Considering setscene task: ['go-bootstrap-native',
> > 'do_populate_sysroot']
> >   considering dependency: ['go-native', 'do_populate_sysroot']
> > Adding dependency on go-bootstrap-native
> > --------------------------------------------------
> > 
> > which lead me to believe that all dependencies are being pulled in
> > simultaneously by do_rootfs, but go-native and go-bootstrap-native
> > are
> > in fact mutually exclusive, since they install to the sysroot in
> > the
> > same location. Note that both compilers build just fine, it's only
> > at
> > the do_rootfs stage that this shows up.
> > 
> > I think the oe-meta-go layer solved this by having go-bootstrap-
> > native
> > install in a different location, but I'm unsure what is the best
> > approach for OE.
> go-bootstrap is only needed for few recipes. I think we should find
> out
> a way to keep this dep limited to those recipes and not reflect in
> final
> image rootfs creation. That seems to be not useful.

There is code in sstate.bbclass in setscene_depvalid:

        # Consider sysroot depending on sysroot tasks
        if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
            [...]
            # Nothing need depend on libc-initial/gcc-cross-initial
            if "-initial" in taskdependees[task][0]:
                continue

so if go-bootstrap-native were renamed go-native-initial, things might
happen to work better...

Cheers,

Richard

