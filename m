Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UZeWl-0001RQ-Cu
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 11:49:45 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 May 2013 02:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,627,1363158000"; d="scan'208";a="309460965"
Received: from lpalcu-linux.rb.intel.com (HELO [10.237.105.165])
	([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2013 02:31:40 -0700
Message-ID: <5188C9FB.1000507@intel.com>
Date: Tue, 07 May 2013 12:31:39 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Kevin Strasser <kevin.strasser@linux.intel.com>
References: <1367571664-2079-1-git-send-email-laurentiu.palcu@intel.com>
	<20130503214032.GA26747@wrk>
In-Reply-To: <20130503214032.GA26747@wrk>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] archive-*-source.bbclass: have do_dumpdata_create_diff_gz task run before do_rootfs
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
X-List-Received-Date: Tue, 07 May 2013 09:49:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Kevin,

On 05/04/2013 12:40 AM, Kevin Strasser wrote:
> Hi Laurentiu,
> 
> On Fri, May 03, 2013 at 12:01:04PM +0300, Laurentiu Palcu wrote:
>> > do_rootfs[cleandirs] contains ${S} and, if do_rootfs task starts before
>> > the do_dumpdata_create_diff_gz is finished, an error will occur in the
>> > process because the directory will be removed while still needed by the
>> > create_diff_gz() function.
>> > 
>> > This patch will force the do_dumpdata_create_diff_gz task to run before
>> > do_rootfs when the final image is created.
>> > 
>> > [YOCTO #4310]
>> > 
>> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> > ---
>> >  meta/classes/archive-configured-source.bbclass |    2 +-
>> >  meta/classes/archive-original-source.bbclass   |    2 +-
>> >  meta/classes/archive-patched-source.bbclass    |    2 +-
>> >  3 files changed, 3 insertions(+), 3 deletions(-)
>> > 
>> > diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
>> > index d346f69..a481b14 100644
>> > --- a/meta/classes/archive-configured-source.bbclass
>> > +++ b/meta/classes/archive-configured-source.bbclass
>> > @@ -14,7 +14,7 @@ addtask do_archive_configured_sources after do_configure
>> >  addtask do_archive_scripts_logs
>> >  
>> >  # Get dump date and create diff file 
>> > -addtask do_dumpdata_create_diff_gz
>> > +addtask do_dumpdata_create_diff_gz before do_rootfs
> This will always add the task to the build, and break our ability to
> filter out packages. I would suggest handling this dependency in the
> anonymous python function after filtering has been applied.
AFAIK, the 'before do_rootfs' doesn't add the task to the build. It
actually forces the task to be run before do_rootfs. I have just tested
this with ARCHIVER_MODE[filter] set to both "no" and "yes" and playing
with COPYLEFT_LICENSE_INCLUDE and COPYLEFT_LICENSE_EXCLUDE. It seeems to
produce the desired effect.

However, and this might be an issue but I'm not sure if this is the
desired behavior(I have to dig in a little), changing
ARCHIVER_MODE[filter] in local.conf does not trigger a recipe reparsing
and you might not see the effect you're expecting. Try removing the
tmp/cache first.

Thanks,
Laurentiu


