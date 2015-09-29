Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DF368762A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 13:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8TDHi8k004015; Tue, 29 Sep 2015 14:17:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KkUvddfvpago; Tue, 29 Sep 2015 14:17:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8TDHUJp003972
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 29 Sep 2015 14:17:41 +0100
Message-ID: <1443532650.5162.31.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Ray, Ian (GE Healthcare)" <ian.ray@ge.com>
Date: Tue, 29 Sep 2015 14:17:30 +0100
In-Reply-To: <30E719D66AEA914CBB7DAB303B1C722D1729D1@BUDURBPA11.e2k.ad.ge.com>
References: <1442819513-20171-1-git-send-email-ian.ray@ge.com>
	<1442819513-20171-2-git-send-email-ian.ray@ge.com>
	<56094576.6070803@enea.com>
	<30E719D66AEA914CBB7DAB303B1C722D1728B4@BUDURBPA11.e2k.ad.ge.com>
	<CAJTo0LZzUa1CYaWt=B6Az9nZ54Sf2_FJvX7SN5z876ZEhS133A@mail.gmail.com>
	<30E719D66AEA914CBB7DAB303B1C722D17290A@BUDURBPA11.e2k.ad.ge.com>
	<56098AA9.2070505@enea.com>
	<30E719D66AEA914CBB7DAB303B1C722D1729D1@BUDURBPA11.e2k.ad.ge.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto][PATCH 1/1] ptest: user-specified run-ptest script location
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
X-List-Received-Date: Tue, 29 Sep 2015 13:18:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-29 at 06:59 +0000, Ray, Ian (GE Healthcare) wrote:
> On 28 September 2015, Tudor Florea wrote:
> > > On 28 September 2015, Ross Burton wrote:
> > > > Surely if an upstream is under your control and is ptest-aware, it can also
> > > > install run-ptest into the right place too?
> > > The run-ptest script is currently required to be in WORKDIR.
> > Actually run-ptest is currently required to be present in
> > /usr/lib/<package>/ptest. If a package is "ptest-aware", that  package
> > should contain a  install-ptest make target which will take care of
> > installing the run-ptest file.
> 
> In summary, the options seem to be as follows:
> 
> # option 1 -- package includes run-ptest, recipe points to it
> PTEST_RUN_SCRIPT_PATH = "path/to/run-ptest"
> 
> # option 2 -- recipe copies run-ptest to WORKDIR
> # This leverages meta/classes/ptest.bbclass do_install_ptest_base.
> do_compile_ptest () {
>         oe_runmake buildtest-TESTS
>         cp ${S}/path/to/run-ptest ${WORKDIR}
> }
> 
> # option 3 -- package installs run-ptest
> # The recipe requires custom do_install_ptest because there is no
> # run-ptest in WORKDIR so meta/classes/ptest.bbclass does not call
> # do_install_ptest_base.
> do_install () {
>         oe_runmake DESTDIR=${D} install
> 
>         # Copied from do_install_ptest_base.
>         install -D ${S}/ptest/run-ptest ${D}${PTEST_PATH}/run-ptest
>         oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
>         chown -R root:root ${D}${PTEST_PATH}
> 
>         # Hack alert!  had to comment out do_install_ptest_base[cleandirs] in
>         # meta/classes/ptest.bbclass to test this option.
> }
> 
> My inexperience shows here with option #3 which attempted to address the comments
> by Ross and Tudor, but which does not actually work (tested on Fido branch).
> 
> Maybe there is an option #4, where the recipe does *not* inherit ptest, but that would
> place a significant burden on the recipe author (detecting PTEST_ENABLED, adding
> tasks, etc).  No doubt there is an easier way.  Sorry for being such a noob!

I think people were suggesting option 4 where your "make install" puts
the file into the correct place in DESTDIR when the install is run.
There is then nothing the recipe needs to do.

Cheers,

Richard




