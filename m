Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 1381B7017D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 12:51:08 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161104125100611_0685
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 05:51:00 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=57758 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c2dxO-0006Ro-Tz for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2016 08:50:55 -0400
Date: Fri, 4 Nov 2016 08:49:52 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611040841040.623@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: trying to build rpm with perl bindings
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
X-List-Received-Date: Fri, 04 Nov 2016 12:51:10 -0000
Content-Type: text/plain; charset=US-ASCII


  for my qemuppc target, i wanted to add perl bindings to the target
"rpm" command, so i checked the "rpm_5.4.16.bb" recipe file to find:

  # Perl modules are not built, but they could be enabled fairly easily
  # the perl module creation and installation would need to be patched.
  # (currently has host perl contamination issues)
  WITH_PERL = "--with-perl --without-perlembed --without-perl-urpm"
  WITHOUT_PERL = "--without-perl --without-perl-urpm"
  PACKAGECONFIG[perl] = "${WITH_PERL},${WITHOUT_PERL},perl,"

um ... ok, no idea what the issue is here but what the heck, let's
just try it and see what happens, so added:

  PACKAGECONFIG_append_pn-rpm = " perl"

to "local.conf", ran "bitbake rpm" and eventually got:

| Making all in perl
| make[2]: Entering directory
'/home/rpjday/oe/builds/msm_qemuppc/tmp/work/ppc7400-poky-linux/rpm/5.4.16-r0/build/perl'
| /usr/bin/perl Makefile.PL CC="powerpc-poky-linux-gcc  -m32
-mhard-float -mcpu=7400 -mno-spe
--sysroot=/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc"
MAKEFILE=Makefile.perl
| Bareword found where operator expected at Makefile.PL line 71, near
"--sysroot"
| 	(Missing operator before sysroot?)
| Can't modify constant item in postdecrement (--) at Makefile.PL line
71, near "spe --"
| syntax error at Makefile.PL line 71, near "--sysroot"
... snip ...

 ????. so i open build/perl/Makefile.PL and, sure enough, down at line
71:

  WriteMakefile(
        'NAME'  => 'RPM',
        'OBJECT'        => join(' ', @objects),
        'VERSION' => '5.4.16',
        'MAKEFILE'=> 'Makefile.perl',
        'CC'      => powerpc-poky-linux-gcc  -m32 -mhard-float -mcpu=7400 -mno-spe
  --sysroot=/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc,
        ... snip ...

doesn't that 'CC' line also need quotes around the value being
assigned? that seems to be a fairly blatant error, no? or am i
misreading something?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================




