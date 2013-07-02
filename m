Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 39C006103B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 17:05:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Jul 2013 09:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,981,1363158000"; d="scan'208";a="339394521"
Received: from lpalcu-linux.rb.intel.com (HELO [10.237.105.165])
	([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 02 Jul 2013 09:21:16 -0700
Message-ID: <51D2FDFB.8040408@intel.com>
Date: Tue, 02 Jul 2013 19:21:15 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1372686507.git.laurentiu.palcu@intel.com>
	<b2b193d7632393d1a1ac091ce01eb9d93d44886b.1372686507.git.laurentiu.palcu@intel.com>
	<CAJTo0LZ=m=no=aiTcBqgGM_J0b5t429xkztCO1gkf-z2hC7UPg@mail.gmail.com>
In-Reply-To: <CAJTo0LZ=m=no=aiTcBqgGM_J0b5t429xkztCO1gkf-z2hC7UPg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] xinput-calibrator: move it from meta-oe to oe-core
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
X-List-Received-Date: Tue, 02 Jul 2013 17:05:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07/02/2013 06:25 PM, Burton, Ross wrote:
> On 1 July 2013 14:57, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>> +do_install() {
>> +    # Only install file if it has a contents
>> +    if [ -s ${S}/pointercal.xinput ]; then
>> +        install -d ${D}${sysconfdir}/
>> +        install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/
>> +    fi
>> +}
> 
> The file always has content because the file in the main recipe has a
> comment in.  Personally I think not installing a useless file is the
> right thing to do, so we should change the default pointercal.xinput
> to be empty.
Then why install it at all if it's empty? I believe a zero sized file in
/etc it's even worse.

> 
> Relatedly, interestingly Weston has a different approach and attaches
> the calibration to the device using udev properties, which means
> systems where touch devices can be hotplugged actually work.  I'm
> incredibly tempted to extend xinput-calibrator to write out udev
> fragments and make Xi respect them if they exist...
Ross, you requested (according to the description in bugzilla:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4416#c0 ) to just move
xinput-calibrator to oe-core from meta-oe. Technically, the first
patchset did just that. It would have been easier for me, from the
planning point of view at least, if I had known in advance the
additional changes you needed for this package. I admit I don't know how
all packages in oe-core or meta-oe should or shouldn't work... I'm
working on improving that though. ;)

So, perhaps it would be better for all of us if you documented all these
additional change requests in bugzilla. Would that be OK with you?

> 
>> +++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
>> +inherit autotools systemd
> 
> systemd?
Will be removed

> 
>> +RPROVIDES_${PN} += "${PN}-systemd"
>> +RREPLACES_${PN} += "${PN}-systemd"
>> +RCONFLICTS_${PN} += "${PN}-systemd"
> 
> It doesn't anymore, so these can be dropped.
Ack

Laurentiu

