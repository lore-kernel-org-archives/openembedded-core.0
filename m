Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0D7FB65C9D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 22:30:10 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1YIlyz-0005TH-Gf from Nathan_Lynch@mentor.com ;
	Tue, 03 Feb 2015 14:30:09 -0800
Received: from [127.0.0.1] (147.34.91.1) by SVR-ORW-FEM-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2; Tue, 3 Feb 2015
	14:28:58 -0800
Message-ID: <54D14BEF.5040509@mentor.com>
Date: Tue, 3 Feb 2015 16:30:07 -0600
From: Nathan Lynch <Nathan_Lynch@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <345DD4F0215D4B4CB8356943BA192C9913E976EE@kihagwinex02.int.kistler.com>
	<CAJTo0LYD0B91NSZ=NC=ZKemczYkkKKQvjnvsmfKqT0tz4C28zQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYD0B91NSZ=NC=ZKemczYkkKKQvjnvsmfKqT0tz4C28zQ@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: run ptest for specific packages or layers
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
X-List-Received-Date: Tue, 03 Feb 2015 22:30:16 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 01/30/2015 09:09 AM, Burton, Ross wrote:
> 
> On 30 January 2015 at 13:39, Markus Boos <Markus.Boos@kistler.com
> <mailto:Markus.Boos@kistler.com>> wrote:
> 
>     We faced the problem that our image (built with ptest feature)
>     doesn't fit into our flash [1].
>     I'd like to run the ptest on real hardware cause some packages need
>     the mounted FPGA functionality.
> 
> 
> Don't use ptest-pkgs to pull the tests into the image, but add the ones
> you want directly.  Such as:
> 
> CORE_IMAGE_EXTRA_INSTALL_append = " ptest-runner myapp-ptest"

Incidentally, I tried this for lttng-tools:

DISTRO_FEATURES_append = " ptest"
CORE_IMAGE_EXTRA_INSTALL_append = " ptest-runner lttng-tools-ptest"

lttng-tools' test script invokes the "prove" command, which does not get
installed:

root@qemuarm:/usr/lib/lttng-tools/ptest# ./run-ptest
[...]
./run.sh unit_tests
./run.sh: line 22: prove: command not found
Makefile:664: recipe for target 'installcheck-am' failed

The "prove" command appears to be provided by perl-misc, so I added that
and retried:

./run.sh unit_tests
Can't locate App/Prove.pm in @INC (you may need to install the
App::Prove module)

Adding perl-modules apparently pulled in the necessary module and got
the tests running.

lttng-tools_2.5.3.bb currently has:

RDEPENDS_${PN}-ptest += "make perl bash"

Should it specify perl-misc and perl-modules instead of just perl?


