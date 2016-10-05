Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9B32E71A4E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 12:00:46 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u95C0kF9008290; Wed, 5 Oct 2016 07:00:46 -0500
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016100507004573-615994 ;
	Wed, 5 Oct 2016 07:00:45 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Burton\, Ross" <ross.burton@intel.com>
In-Reply-To: <87bmyzdqfp.fsf@ni.com>
References: <20160908095633.26651-1-adrian.ratiu@ni.com>
	<CAJTo0LaDjgTd20i-BQ5QQrWrKms3rfq-vNCiqVB7yz6f8VAmpg@mail.gmail.com>
	<878tv2znhb.fsf@ni.com>
	<CAJTo0LY_6wg10ft-RNRrYH7xa93=aWB9LuH=gxEpgf19vC446Q@mail.gmail.com>
	<871t0tzads.fsf@ni.com>
	<CAJTo0LZtsxhz=5=XdBWDQVMZpXyXqi11h2OS5XY5HOrUXkMmnA@mail.gmail.com>
	<87bmyzdqfp.fsf@ni.com>
Date: Wed, 05 Oct 2016 14:59:13 +0300
Message-ID: <878tu3gg6m.fsf@adi-pc-linux.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/05/2016 07:00:46 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/05/2016 07:00:46 AM,
	Serialize complete at 10/05/2016 07:00:46 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-10-05_04:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: add libpcre to DEPENDS
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
X-List-Received-Date: Wed, 05 Oct 2016 12:00:49 -0000
Content-Type: text/plain

On Wed, 05 Oct 2016, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> Hi again
>
> On Fri, 09 Sep 2016, "Burton, Ross" <ross.burton@intel.com> wrote:
>> On 9 September 2016 at 10:32, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
>>
>>> I cleared the build directory and sstate cache, started with a clean
>>> rebuild and I can't reproduce the error anymore. gen-all-unicode is
>>> built as expected and at runtime it links with libpcre as expected
>>> and the build succeeds. This is really weird, I didn't touch these
>>> packages at all, they just sporadically failed out of the blue and now
>>> they work.
>>>
>>
>> That's good, right? :)
>>
>> If you ever manage to replicate, please save the build directory for
>> inspection.
>
> I managed to replicate this and save the build directory to inspect it!
>
> Here's what happens:
> Besides oe-core we're using meta-selinux which has a libpcre-%.bbappend
> which moves the location of libpcre.so from /usr/lib to /lib in the
> sysroot and points the symlink to the file in /lib using relative paths.
>
> ldd tests/gen-all-unicode gives this:
>
> $ ldd tests/gen-all-unicode
> 	linux-vdso.so.1 (0x00007fff27263000)
> 	libglib-2.0.so.0 => /mnt/build/jenkins-jobs/nilrt_OE_toolchain-cardassia/workspace/build/tmp-glibc/sysroots/x86_64-linux/usr/lib/libglib-2.0.so.0 (0x00007f542823a000)
> 	libpcre.so.1 => not found
> 	libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f542801d000)
> 	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f5427c72000)
> 	libpcre.so.1 => /mnt/build/jenkins-jobs/nilrt_OE_toolchain/workspace/build/tmp-glibc/sysroots/x86_64-linux/usr/lib/../../lib/libpcre.so.1 (0x00007f5427a2f000)
> 	/lib64/ld-linux-x86-64.so.2 (0x00007f5428546000)
>
> I don't understand why libpcre.so.1 appears twice with the first not found.
>
> The file pointed to by the libpcre.so.1 symlink exists but somehow the
> loader can't find it? Maybe it's the ../.. in the path? or does an
> variable like LD_LIBRARY_PATH need to be set in the bb recipe/append?

I think libpcre_%.bbappend in meta-selinux is just missing the following
line:

ln -sf ${relpath}/${realsofile} ${D}${libdir}/libpcre.so.1

after creating this symlink the build works without problems (previously
only libpcre.so symlink was created).

Is this a proper solution?

>
> Ionel
>
>>
>> Ross
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

