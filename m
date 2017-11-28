Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBB660720
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 13:15:24 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vASDFH3p005954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 28 Nov 2017 13:15:19 GMT
Message-ID: <1511874917.862.134.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 28 Nov 2017 13:15:17 +0000
In-Reply-To: <6a03b501-31d9-5e20-4c40-ce381bb4ad17@windriver.com>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com>
	<45922039-30bd-7fbc-89be-c037c068a0db@windriver.com>
	<1511432407.862.111.camel@linuxfoundation.org>
	<90368c50-316e-b03e-252f-33110c059737@windriver.com>
	<bfe14ba9-7de8-6e8d-9d26-2fd05a4e62a2@windriver.com>
	<6a03b501-31d9-5e20-4c40-ce381bb4ad17@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org, "Xu, Chi" <Chi.Xu@windriver.com>,
	"WOLD, SAUL" <saul.wold@intel.com>
Subject: =?UTF-8?B?UmU6IEdvb2QgbmV3cyBSZTogWW9jdG8gUHJvamVjdCBTdGF0dXMgV1c0N+KAmTE3?=
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
X-List-Received-Date: Tue, 28 Nov 2017 13:15:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-11-28 at 20:48 +0800, Robert Yang wrote:
> Hi RP,
> On 11/28/2017 06:47 PM, Robert Yang wrote:
> > # Works
> > $ runqemu tmp/deploy/images/qemux86-64/ nographic snapshot
> > 
> > # Doesn't work, like hang:
> > $ runqemu tmp/deploy/images/qemux86-64/ nographic snapshot kvm
> I upgraded qemu-native to qemu-2.11.0-rc2, then no hangs any more. I
> dropped
> the conflicted patches during upgrade. I will send a formal upgrade
> tomorrow
> it this is acceptable.
> 
> Here is the draft patch for testing:
> 
>    git://git.openembedded.org/openembedded-core-contrib rbt/qemu_test
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/
> qemu_test

Thanks for the data point. I've been putting my data into:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=12301

As you can see there, I think there are actually two issues:

a) A boot hang around the ..TIMER line where the guest isn't getting
timer interupts

b) Something which causes the APIC to see "version 0".

I applied the 2.11-rc2 upgrade and it seemed to stop the hangs I was
seeing with "-no-kvm-irqchip" but doesn't stop the ones I see without
that.

I am seeing hangs in guests where the version 0 message appears as well
as where we see 0x14. The 0x14 versions do boot further into userspace
usually.

It also seems host hardware specific as I cannot get my local build
machine to hang as yet. That could mean its timing or could be cpu
revision, I've removed many but not all OS differences :/.

Cheers,

Richard

