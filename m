Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TODEe-0000V1-De
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 21:55:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Oct 2012 12:39:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,595,1344236400"; d="scan'208";a="235940844"
Received: from unknown (HELO [10.255.13.226]) ([10.255.13.226])
	by fmsmga002.fm.intel.com with ESMTP; 16 Oct 2012 12:39:34 -0700
Message-ID: <507DB7F6.9030208@linux.intel.com>
Date: Tue, 16 Oct 2012 12:39:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1350038799-22567-1-git-send-email-Martin.Jansa@gmail.com>
	<50785628.8060504@linux.intel.com>
	<20121012175629.GB3605@jama.jama.net>
In-Reply-To: <20121012175629.GB3605@jama.jama.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] PACKAGES_DYNAMIC: use regexp not glob
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Oct 2012 19:55:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2012 10:56 AM, Martin Jansa wrote:
> On Fri, Oct 12, 2012 at 10:40:56AM -0700, Saul Wold wrote:
>> On 10/12/2012 03:46 AM, Martin Jansa wrote:
>>> * bitbake uses PACKAGES_DYNAMIC as regexp
>>>     ^ could make matching faster (and it will be more clear that we're expecting regexp not glob)
>>>     * made all those last '-' optional, use .* (or nothing)
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>    meta/classes/kernel.bbclass                              | 6 +++---
>>>    meta/conf/bitbake.conf                                   | 2 +-
>>>    meta/recipes-connectivity/connman/connman.inc            | 2 +-
>>>    meta/recipes-core/eglibc/eglibc-locale.inc               | 6 +++---
>>>    meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 2 +-
>>>    meta/recipes-devtools/perl/perl_5.14.2.bb                | 4 ++--
>>>    meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb        | 2 +-
>>>    meta/recipes-extended/pam/libpam_1.1.6.bb                | 2 +-
>>>    meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb       | 2 +-
>>>    meta/recipes-gnome/gtk+/gtk+_2.24.8.bb                   | 2 +-
>>>    meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb     | 2 +-
>>>    meta/recipes-graphics/directfb/directfb.inc              | 2 +-
>>>    meta/recipes-graphics/mesa/mesa-dri.inc                  | 2 +-
>>>    meta/recipes-graphics/pango/pango.inc                    | 2 +-
>>>    meta/recipes-kernel/linux/linux-dummy.bb                 | 4 ++--
>>>    meta/recipes-multimedia/gstreamer/gst-plugins.inc        | 2 +-
>>>    meta/recipes-multimedia/pulseaudio/pulseaudio.inc        | 2 +-
>>>    meta/recipes-qt/qt-apps/qmmp_0.6.1.bb                    | 2 +-
>>>    meta/recipes-qt/qt4/qt4-embedded.inc                     | 2 +-
>>>    meta/recipes-qt/qt4/qt4.inc                              | 2 +-
>>>    20 files changed, 26 insertions(+), 26 deletions(-)
>>>
>> Martin,
>>
>> Did you do any verification with the buildhistory tools to ensure
>> nothing changed in the packaging?
>
> Yes, last 12 commits in
> https://github.com/shr-distribution/buildhistory/commits/jama
>
> e.g. for om-gta02
> https://github.com/shr-distribution/buildhistory/commit/55d9cb4fa438e64c9fcc4ef0966164779c5dc974
> https://github.com/shr-distribution/buildhistory/commit/c0b3897e04fd9669c557620ca48fde05f01e7aca
>
> but it's together with last change to perl, eglibc, pkgconfig.
>
I did track down this failure to your change, possibly something missed 
in kernel.bbclass:

> ERROR: Nothing RPROVIDES 'kernel-modules' (but /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/meta/recipes-core/packagegroups/packagegroup-base.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'kernel-modules' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['kernel-modules']
> NOTE: Runtime target 'packagegroup-base-extended' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-base-extended', 'kernel-modules']

I was attempting to build core-image-sato and core-image-sato-sdk on 
qemumips or routerstation, I was able to see this failure on other 
MACHINES also.

Thanks
	Sau!



> Cheers,
>


