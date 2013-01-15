Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Tv7Nr-0005bj-CX
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 15:20:59 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jan 2013 06:05:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,473,1355126400"; d="scan'208";a="273998238"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jan 2013 06:05:36 -0800
Message-ID: <50F56230.7000605@intel.com>
Date: Tue, 15 Jan 2013 16:05:36 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1358181569-30628-1-git-send-email-laurentiu.palcu@intel.com>
	<20130114164905.GF2992@jama> <50F51BE9.6080302@intel.com>
In-Reply-To: <50F51BE9.6080302@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox.inc: have the busybox-syslog postinstall run on host
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
X-List-Received-Date: Tue, 15 Jan 2013 14:21:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/15/2013 02:24 PM, Martin Jansa wrote:
>> This is a valid concern. It would certainly start them both or, at
>> > least, try. But, is it normal for one to have two different syslog
>> > implementations installed? Is this a valid use case?
> That's why we're using u-a for init script, isn't it?
>
I guess you're right. I'll have to find another solution. Most likely,
change update-rc.d script so that it gets the file the link points to,
append the rootfs path to it and then check for the actual file's
existence before reporting an error.

> Imho the problem is only order of postinst where update-rc.d is executed
> before u-a postinst.
No, the problem is not on target. The problem is when the postinst is
run on host. Basically, update-rc.d will run on a file that points to a
path on target:

/path/to/target/rootfs/syslog -> /etc/init.d/syslog.busybox

On host, this link is invalid and update-rc.d will exit with error.
Hence, the postinst will be postponed.

Thanks,
Laurentiu

>
> Cheers,
>


