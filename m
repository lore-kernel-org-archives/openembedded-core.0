Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 671BC79E8B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 06:31:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA26V0hW005094
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Nov 2018 23:31:00 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 1 Nov 2018 23:30:59 -0700
To: <openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"Burton, Ross" <ross.burton@intel.com>
References: <cover.1541133621.git.Qi.Chen@windriver.com>
	<20181102050316.13843.29574@do.openembedded.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <c90eb9d6-8870-13f6-d7fb-95e9e7ed6974@windriver.com>
Date: Fri, 2 Nov 2018 14:37:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20181102050316.13843.29574@do.openembedded.org>
X-Originating-IP: [128.224.162.218]
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHN5c3RlbWQ6IGJhY2twb3J0IHBhdGNoZXMgdG8gZml4IDMgQ1ZFcyAocmV2Mik=?=
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
X-List-Received-Date: Fri, 02 Nov 2018 06:31:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I finally found out the problem. I think the cve tag checking logic in 
patchtest-oe has some problem.

The current logic errors out if and only if the patch has a line which 
begins with 'CVE-YYYY-XXXX' and contains nothing else. It does not error 
out if the patch contains no CVE information, nor will it error out if 
the patch contains line like ' CVE-YYYY-XXXX' (spaces followed by cve 
id). What's worse, if the backported patch itself contains a line 
'CVE-YYYY-XXXX', this cve tag checking code errors out, and this is the 
error I got in this patch.

I've sent out a patch to yocto to fix this issue.
Title is: [yocto] [patchtest-oe][PATCH] test_patch_cve.py: fix cve tag 
checking logic

Do you think I need to tweak the patches according to the current cve 
tag checking rule and send out V3?

Best Regards,
Chen Qi

On 11/02/2018 01:03 PM, Patchwork wrote:
> == Series Details ==
>
> Series: systemd: backport patches to fix 3 CVEs (rev2)
> Revision: 2
> URL   : https://patchwork.openembedded.org/series/14759/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Patch            [1/3] systemd: fix CVE-2018-15686
>   Issue             Missing or incorrectly formatted CVE tag in included patch file [test_cve_tag_format]
>    Suggested fix    Correct or include the CVE tag on cve patch with format: "CVE: CVE-YYYY-XXXX"
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
>


