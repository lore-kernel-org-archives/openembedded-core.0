Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TEO1q-0002eO-VG
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 19:25:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Sep 2012 10:12:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,450,1344236400"; d="scan'208";a="194933753"
Received: from unknown (HELO [10.252.121.202]) ([10.252.121.202])
	by orsmga001.jf.intel.com with ESMTP; 19 Sep 2012 10:12:55 -0700
Message-ID: <5059FD16.6070109@intel.com>
Date: Wed, 19 Sep 2012 20:12:54 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<949436f21dca1d0f73ff55f2692d8c1459657fa2.1348052899.git.laurentiu.palcu@intel.com>
	<CAJTo0LafLwJxBi4eG_CF+iviJbPT4HwtDdkssCAGeOgzv1t2XQ@mail.gmail.com>
	<5059E893.1060300@intel.com>
	<CAJTo0Laae2ZaE+8E_Co3rUQbYtQOtK41wGtBi8sRdWDWnXzjDg@mail.gmail.com>
In-Reply-To: <CAJTo0Laae2ZaE+8E_Co3rUQbYtQOtK41wGtBi8sRdWDWnXzjDg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 2/7] image.bbclass: run postinst scripts once, at rootfs time
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
X-List-Received-Date: Wed, 19 Sep 2012 17:25:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/19/2012 06:50 PM, Burton, Ross wrote:
> On 19 September 2012 16:45, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>> I'm a little confused here... Technically, when the postprocess hooks
>> are executed all the postinstall scripts were already executed. Ideally,
>> the run-once scripts are created from inside the postinst scriptlets
>> themselves. So, I don't really understand why using the postprocess hook
>> isn't safe. Can you please elaborate?
> 
> My concern (and it's just a hunch) is that there could be a
> post-process hook running before the intercepts are run which could be
> expecting the post install phase to have been completed.  With
> intercepts a portion of the post-install phase is happening later than
> they previously did, so they haven't completely been ran yet.
I see your point now... The only place we could do it in image.bbclass
is immediately after rootfs_${IMAGE_PKGTYPE}_do_rootfs in do_rootfs()
function. But then we fall into the same issue you mentioned. The
post-process hooks would be executed before the intercept scripts...

The alternative would be to use the post-install hooks
(ROOTFS_POSTINSTALL_COMMAND) instead of post-process. These are executed
before the post-process hooks.

Thanks,
Laurentiu

> 
> Ross
> 


