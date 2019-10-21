Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id AF23C7F57D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 17:23:17 +0000 (UTC)
Received: from Marks-MacBook-Pro.local ([76.164.61.198]) (authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id x9LHNHhG007915
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 12:23:18 -0500
To: openembedded-core@lists.openembedded.org
References: <20190204031153.1348-1-jacob.kroon@gmail.com>
	<CAJdd5GbA3MJ9KpbY81EkqfUvGwa8jZD7F8u-f+48NvKX9X+hsA@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <b69b9906-0ab0-3d7d-7cc1-99dafbb37528@kernel.crashing.org>
Date: Mon, 21 Oct 2019 12:23:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAJdd5GbA3MJ9KpbY81EkqfUvGwa8jZD7F8u-f+48NvKX9X+hsA@mail.gmail.com>
Subject: Re: [PATCH v2] base-passwd: Add kvm group
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
X-List-Received-Date: Mon, 21 Oct 2019 17:23:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/21/19 12:03 PM, Joshua Watt wrote:
> On Sun, Feb 3, 2019 at 9:13 PM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>>
>> Although base-passwd in OE is somewhat outdated, upgrading
>> to a newer version is not going to solve eudev warnings about
>> missing groups during boot; input/shutdown/kvm are still not
>> listed in groups.master. The reason for this is that
>> Debian uses systemd, which will automatically create
>> missing groups(systemd-sysusers). In a sysvinit+eudev
>> configuration you instead get a warning printed to
>> the console:
> 
> There is an unfortunate problem with this patch that is causing us
> build failures when using useradd-staticids. Part of this might be our
> fault for not realizing the repercussions in the way we chose static
> IDs, but it exposes some deeper issues with this approach to "patching
> in" new users and groups that we need to be careful about.
> 
> In our case, the problem is that we added the netdev group to our
> static group file at ID 47. As such, we get a warning when the netdev
> group is created:
>  groupadd: GID '47' already exists.
> 
> For our part, choosing to tightly pack the group IDs and fill in the
> missing holes with our own static IDs when those static IDs might be
> allocated by upstream in the future was probably a poor choice.
> However, the same reasons that make it a poor choice for us also apply
> to this patch. Upstream doesn't have this GID, and *could* (although
> unlikely will) add a different group at ID 47, which would conflict
> with this patch and cause a lot of havoc with anyone using
> useradd-staticids.
> 
> Compounding this is the problem that the users and groups in
> base-passwd don't play nice in general with useradd-staticids. The
> users and groups provided by base-passwd are always assumed to exists
> with the fixed IDs assigned by the recipe, and there is no mechanism
> to override the assigned IDs with a static ID file as can be done with
> useradd.bbclass (also, adding support doesn't appear to be trivial).

This was part of the original design of the static ids.

When using static IDs, you should be providing your own base passwd/group files
and optionally the static mapping files as well.

This is the purpose of the USERADD_UID_TABLES, you can pass in the passwd/group
files as inputs to these...

> In general, I don't think we should be "patching in" users and groups
> like this to base-passwd. If upstream doesn't have them, they need to
> be added through the normal useradd.bbclass mechanism so that users of
> useradd-staticids can choose what ID they get mapped to.
> 
> Is it possible to revert this and add the kvm group via the useradd.bbclass?
> 
>>
>>   udevd[<pid>]: specified group 'kvm' unknown

As for this particular patch, why is adding a specific KVM group required?
Unless something is hardcoded in KVM to use group '47', a regular system type
useradd call should be done instead.  This would avoid the problem that Joshua
is experiencing.

--Mark

>> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
>> ---
>>
>> v2: Add reasoning in commit message trying to justify the added patch
>>
>>  .../base-passwd/base-passwd/kvm.patch         | 23 +++++++++++++++++++
>>  .../base-passwd/base-passwd_3.5.29.bb         |  3 ++-
>>  2 files changed, 25 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/recipes-core/base-passwd/base-passwd/kvm.patch
>>
>> diff --git a/meta/recipes-core/base-passwd/base-passwd/kvm.patch b/meta/recipes-core/base-passwd/base-passwd/kvm.patch
>> new file mode 100644
>> index 0000000000..113d5151e7
>> --- /dev/null
>> +++ b/meta/recipes-core/base-passwd/base-passwd/kvm.patch
>> @@ -0,0 +1,23 @@
>> +From 6355278b9f744291864c373a32a8da8f84aaaf37 Mon Sep 17 00:00:00 2001
>> +From: Jacob Kroon <jacob.kroon@gmail.com>
>> +Date: Wed, 30 Jan 2019 04:53:48 +0000
>> +Subject: [PATCH] Add kvm group
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
>> +---
>> + group.master | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/group.master b/group.master
>> +index cea9d60..5b62284 100644
>> +--- a/group.master
>> ++++ b/group.master
>> +@@ -34,6 +34,7 @@ utmp:*:43:
>> + video:*:44:
>> + sasl:*:45:
>> + plugdev:*:46:
>> ++kvm:*:47:
>> + staff:*:50:
>> + games:*:60:
>> + shutdown:*:70:
>> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
>> index c6be1c1d08..d1aab09181 100644
>> --- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
>> +++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
>> @@ -12,7 +12,8 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
>>             file://noshadow.patch \
>>             file://input.patch \
>>             file://disable-docs.patch \
>> -          "
>> +           file://kvm.patch \
>> +           "
>>
>>  SRC_URI[md5sum] = "6beccac48083fe8ae5048acd062e5421"
>>  SRC_URI[sha256sum] = "f0b66388b2c8e49c15692439d2bee63bcdd4bbbf7a782c7f64accc55986b6a36"
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

