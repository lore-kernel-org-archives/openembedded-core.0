Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C1AF60043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 11:56:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7RBtsv4018935
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Aug 2015 04:55:54 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Thu, 27 Aug 2015 04:55:54 -0700
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1440587914-1280-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1440587914-1280-2-git-send-email-markus.lehtonen@linux.intel.com>
	<55DDD564.9090304@windriver.com>
	<D204584A.577A5%markus.lehtonen@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55DEFAC9.3010601@windriver.com>
Date: Thu, 27 Aug 2015 06:55:53 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <D204584A.577A5%markus.lehtonen@linux.intel.com>
Subject: Re: [PATCH 1/3] package_rpm: support signing of rpm packages
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
X-List-Received-Date: Thu, 27 Aug 2015 11:56:12 -0000
X-Groupsio-MsgNum: 70153
Content-Type: multipart/mixed; boundary="------------010505040802010807070409"

--------------010505040802010807070409
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 8/26/15 10:11 PM, Markus Lehtonen wrote:
>> Without pasting the whole patch:
>>
>> --- createrepo-0.4.11.orig/dumpMetadata.py
>> +++ createrepo-0.4.11/dumpMetadata.py
>> @@ -92,7 +92,7 @@ def returnHdr(ts, package):
>> -    ts.setVSFlags((rpm.RPMVSF_NOMD5|rpm.RPMVSF_NEEDPAYLOAD))
>> +
>> ts.setVSFlags((rpm.RPMVSF_NOMD5|rpm.RPMVSF_NEEDPAYLOAD|rpm.RPMVSF_NODSA|rp
>> m.RPMVSF_NORSA|rpm.RPMVSF_NODSAHEADER|rpm.RPMVSF_NORSAHEADER))
>>
>> I can send up this change if you think it's useful in this case (and would
>> eliminate these steps.)
> 
> I can introduce a separate patch in the next version of this patchset.
> 

The patch we use is attached.  (it's just a patch, not a proper git commit..)

> 
> 
>>
>> (The reason I question the steps is purely because we've seen in the past
>> these
>> temporary RPM databases seem to be fragile at times.  So anything we can
>> do to
>> avoid that is probably good.)
> 
> Yes.
> 
> 
> Thanks,
>   Markus
> 
> 


--------------010505040802010807070409
Content-Type: text/plain; charset="UTF-8"; x-mac-type=0; x-mac-creator=0;
	name="createrepo-skipsigned.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="createrepo-skipsigned.patch"

createrepo: Disable GPG signature validation

If the packages are signed, and the signature is not in the rpm-native
RPMDB, an error will occur.  We want to avoid this failure mode 
when building the native version of createrepo.

This only affects the feed generation and will not change any later
validations during use/install from the package feed.

Upstream-status: Inappropriate [no longer maintained version]

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

Index: createrepo-0.4.11/dumpMetadata.py
===================================================================
--- createrepo-0.4.11.orig/dumpMetadata.py
+++ createrepo-0.4.11/dumpMetadata.py
@@ -92,7 +92,7 @@ def returnHdr(ts, package):
             fdno = package # let's assume this is an fdno and go with it :)
     except OSError:
         raise MDError, "Error opening file"
-    ts.setVSFlags((rpm.RPMVSF_NOMD5|rpm.RPMVSF_NEEDPAYLOAD))
+    ts.setVSFlags((rpm.RPMVSF_NOMD5|rpm.RPMVSF_NEEDPAYLOAD|rpm.RPMVSF_NODSA|rpm.RPMVSF_NORSA|rpm.RPMVSF_NODSAHEADER|rpm.RPMVSF_NORSAHEADER))
     try:
         hdr = ts.hdrFromFdno(fdno)
     except rpm.error:

--------------010505040802010807070409--
