Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A514E72F3D;
	Mon, 24 Apr 2017 22:00:11 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1d2m1k-0002ll-NC from Nathan_Lynch@mentor.com ;
	Mon, 24 Apr 2017 15:00:12 -0700
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Mon, 24 Apr 2017 15:00:10 -0700
From: Nathan Lynch <nathan_lynch@mentor.com>
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CAJTo0La+bGDBuJ42yVy79hW2iN3ZhpeyjXrhUApLn-PAi6PYBw@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
	<CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
	<CAJTo0La+bGDBuJ42yVy79hW2iN3ZhpeyjXrhUApLn-PAi6PYBw@mail.gmail.com>
Date: Mon, 24 Apr 2017 17:00:07 -0500
Message-ID: <87a875qxeg.fsf@largeson.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 22:00:12 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton@intel.com> writes:

> On 24 April 2017 at 10:09, Burton, Ross <ross.burton@intel.com> wrote:
>
>> All merged, I'll fire in a moment.
>>
>
> lttng-modules fails:
>
> In function 'lib_ring_buffer_align',
>     inlined from 'lib_ring_buffer_try_reserve' at
> TOPDIR/tmp/work/qemumips-poky-linux/lttng-modules/2.9.1-r0/lttng-modules-2.9.1/lib/ringbuffer/frontend_api.h:118:3,
>     inlined from 'lib_ring_buffer_reserve' at
> TOPDIR/tmp/work/qemumips-poky-linux/lttng-modules/2.9.1-r0/lttng-modules-2.9.1/lib/ringbuffer/frontend_api.h:179:6,
>     inlined from 'lttng_event_reserve' at
> TOPDIR/tmp/work/qemumips-poky-linux/lttng-modules/2.9.1-r0/lttng-modules-2.9.1/lttng-ring-buffer-metadata-client.h:317:6:
> TOPDIR/tmp/work-shared/qemumips/kernel-source/include/linux/compiler.h:518:38:
> error: call to '__compiletime_assert_269' declared with attribute error:
> BUILD_BUG_ON failed: (size_of_type) == 0 || ((size_of_type) &
> ((size_of_type) - 1))
>   _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>                                       ^
>
> Suggestions welcome :)


Does adding this patch to lttng-modules work around it?


diff --git a/lib/align.h b/lib/align.h
index 5b91ae87410b..5e134cd485fe 100644
--- a/lib/align.h
+++ b/lib/align.h
@@ -48,7 +48,7 @@
  */
 #define offset_align(align_drift, alignment)				       \
 	({								       \
-		BUILD_RUNTIME_BUG_ON((alignment) == 0			       \
+		BUG_ON((alignment) == 0					       \
 				   || ((alignment) & ((alignment) - 1)));      \
 		(((alignment) - (align_drift)) & ((alignment) - 1));	       \
 	})
@@ -63,7 +63,7 @@
  */
 #define offset_align_floor(align_drift, alignment)			       \
 	({								       \
-		BUILD_RUNTIME_BUG_ON((alignment) == 0			       \
+		BUG_ON((alignment) == 0					       \
 				   || ((alignment) & ((alignment) - 1)));      \
 		(((align_drift) - (alignment)) & ((alignment) - 1));	       \
 	})

