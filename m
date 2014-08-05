Return-Path: <darren.hart@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF2F60C19
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 22:35:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2014 15:30:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,807,1400050800"; d="scan'208";a="583906355"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2014 15:35:50 -0700
Received: from fmsmsx158.amr.corp.intel.com (10.18.116.75) by
	FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 5 Aug 2014 15:35:50 -0700
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.224]) by
	fmsmsx158.amr.corp.intel.com ([169.254.15.211]) with mapi id
	14.03.0123.003; Tue, 5 Aug 2014 15:35:49 -0700
From: "Hart, Darren" <darren.hart@intel.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"Wold, Saul" <saul.wold@intel.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 2/2] code cleanup for INITRD variable handing
Thread-Index: AQHPsPU7jp1yiF94WkWrstyg5Jwf85vCmUmA
Date: Tue, 5 Aug 2014 22:35:49 +0000
Message-ID: <D006A86F.9F880%darren.hart@intel.com>
References: <cover.1407274547.git.nitin.a.kamble@intel.com>
	<e02335b6134805d1806b77cba830c134231bd925.1407274547.git.nitin.a.kamble@intel.com>
In-Reply-To: <e02335b6134805d1806b77cba830c134231bd925.1407274547.git.nitin.a.kamble@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.254.176.132]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] code cleanup for INITRD variable handing
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
X-List-Received-Date: Tue, 05 Aug 2014 22:35:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B2894CEC482C0B4E9BC7CBA3A7513DE4@intel.com>
Content-Transfer-Encoding: quoted-printable

On 8/5/14, 14:39, "Kamble, Nitin A" <nitin.a.kamble@intel.com> wrote:

>From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
>* Remove an unnecessary check
>* Instead of ignoring, report the errors

This isn't enough to ask for a resend, but please be a bit more explicit
in what is going on in future commit messages, for example:

INITRD: Cleanup file tests and report errors

The null string test (-n) is no longer necessary as it is inherent in the
for loop.

If the INITRD file element is missing or of zero size, abort with bbfatal.

>
>Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>

Reviewed-by: Darren Hart <dvhart@linux.intel.com>


>---
> meta/classes/boot-directdisk.bbclass | 4 +++-
> meta/classes/bootimg.bbclass         | 2 ++
> 2 files changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/meta/classes/boot-directdisk.bbclass
>b/meta/classes/boot-directdisk.bbclass
>index 995d3e7..5107d7f 100644
>--- a/meta/classes/boot-directdisk.bbclass
>+++ b/meta/classes/boot-directdisk.bbclass
>@@ -76,8 +76,10 @@ boot_direct_populate() {
> 		rm -f $dest/initrd
> 		for fs in ${INITRD}
> 		do
>-			if [ -n "${fs}" ] && [ -s "${fs}" ]; then
>+			if [ -s "${fs}" ]; then
> 				cat ${fs} >> $dest/initrd
>+			else
>+				bbfatal "${fs} is invalid. initrd image creation failed."
> 			fi
> 		done
> 		chmod 0644 $dest/initrd
>diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
>index 7b3ce65..859d517 100644
>--- a/meta/classes/bootimg.bbclass
>+++ b/meta/classes/bootimg.bbclass
>@@ -75,6 +75,8 @@ populate() {
> 		do
> 			if [ -s "${fs}" ]; then
> 				cat ${fs} >> ${DEST}/initrd
>+			else
>+				bbfatal "${fs} is invalid. initrd image creation failed."
> 			fi
> 		done
> 		chmod 0644 ${DEST}/initrd
>--=20
>1.8.1.4
>
>


--=20
Darren Hart					Open Source Technology Center
darren.hart@intel.com				            Intel Corporation



