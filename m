Return-Path: <gtertych@cisco.com>
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
	by mail.openembedded.org (Postfix) with ESMTP id EFD0A6011A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 22:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=2608; q=dns/txt; s=iport;
	t=1539209783; x=1540419383;
	h=references:from:to:cc:subject:in-reply-to:date:
	message-id:mime-version;
	bh=XudvHe3A6iAY2YxkoDBQEohNWrtw86PovsT1Ii8S97w=;
	b=SR3FH5QzURWvTHfssJ+NkDmrMjDgU8rccpdR9H9yQuiDmz8N/LCrQ42a
	MKtEZZioO3iLEdaopCSLUJNg6eBt7Ny4bWEHI+fZBeWcXrDkItoHxtyut
	MPqaiK0+K1Fsb2w5j73y8fLCqusUljCe3PRrZyLguOcTVqyiDIG+KLe3S 0=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ASAAAmeb5b/xbLJq1jGwEBAQEDAQE?=
	=?us-ascii?q?BBwMBAQGBUgUBAQELAYJpfyiMao1jiQCNf4F6CwEBG4RRAoRxNQwNAQMBAQI?=
	=?us-ascii?q?BAQJtHAyFOQEBAQECAXkFCwsYCSUPASwbBhODIoF0BQinXIR3hGkUDoswgUE?=
	=?us-ascii?q?/hCSBQQGJFAKPII5mCYZRigAXgU9Lhy6GQyyVOQIEBgUCFIFEATWBVXAVgyc?=
	=?us-ascii?q?JgimJNoRwPDCNZQEB?=
X-IronPort-AV: E=Sophos;i="5.54,366,1534809600"; 
   d="scan'208";a="7087492"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Oct 2018 22:16:21 +0000
Received: from think ([10.61.166.15])
	by aer-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id w9AMGLhH026700
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); 
	Wed, 10 Oct 2018 22:16:21 GMT
References: <20181010162624.7377-1-gtertych@cisco.com>
	<6238cb7b-8148-a707-89c6-151e1148bb76@gmail.com>
User-agent: mu4e 1.0; emacs 25.2.2
From: Grygorii Tertychnyi <gtertych@cisco.com>
To: akuster808 <akuster808@gmail.com>
In-reply-to: <6238cb7b-8148-a707-89c6-151e1148bb76@gmail.com>
Date: Thu, 11 Oct 2018 01:16:23 +0300
Message-ID: <87k1mpo3bc.fsf@cisco.com>
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.61.166.15, [10.61.166.15]
X-Outbound-Node: aer-core-2.cisco.com
Cc: xe-linux-external@cisco.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] lib/oe/utils: add eol to format_pkg_list()
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
X-List-Received-Date: Wed, 10 Oct 2018 22:16:22 -0000
Content-Type: text/plain


akuster808 writes:

> Grygorii,
>
>
> On 10/10/2018 09:26 AM, grygorii tertychnyi via Openembedded-core wrote:
>> Append '\n' to the non-empty formatted string before return. If you
>> write it to the (manifest) file, it will ensure file ends with a newline.
>>
>> Many GNU utilities have problems processing the last line of a file
>> if it is not '\n' terminated. E.g. if the last line is not terminated
>> by a newline character, then "read" will read it but return false,
>> leaving the broken partial line in the read variable(s).
>> It can also break or adversely affect some text processing tools,
>> that operate on the file.
>
> is this needed for the cve patches?

No

>
> - armin
>> Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
>> ---
>>
>> Changes in v3:
>>  o write_image_manifest(): remove extra '\n'
>>
>> PASS bitbake buildtools-tarball
>> PASS bitbake core-image-minimal                                                                                              
>> PASS bitbake core-image-sato -c do_populate_sdk_ext
>> PASS oe-selftest --run-tests manifest.VerifyManifest.test_image_manifest_entries
>>
>>  meta/classes/rootfs-postcommands.bbclass | 1 -
>>  meta/lib/oe/utils.py                     | 8 +++++++-
>>  2 files changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
>> index e816824f28..bde58ad6cd 100644
>> --- a/meta/classes/rootfs-postcommands.bbclass
>> +++ b/meta/classes/rootfs-postcommands.bbclass
>> @@ -253,7 +253,6 @@ python write_image_manifest () {
>>      pkgs = image_list_installed_packages(d)
>>      with open(manifest_name, 'w+') as image_manifest:
>>          image_manifest.write(format_pkg_list(pkgs, "ver"))
>> -        image_manifest.write("\n")
>>  
>>      if os.path.exists(manifest_name):
>>          manifest_link = deploy_dir + "/" + link_name + ".manifest"
>> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
>> index 93b0763b0a..d05f517a70 100644
>> --- a/meta/lib/oe/utils.py
>> +++ b/meta/lib/oe/utils.py
>> @@ -347,7 +347,13 @@ def format_pkg_list(pkg_dict, ret_format=None):
>>          for pkg in sorted(pkg_dict):
>>              output.append(pkg)
>>  
>> -    return '\n'.join(output)
>> +    output_str = '\n'.join(output)
>> +
>> +    if output_str:
>> +        # make sure last line is newline terminated
>> +        output_str += '\n'
>> +
>> +    return output_str
>>  
>>  def host_gcc_version(d, taskcontextonly=False):
>>      import re, subprocess


