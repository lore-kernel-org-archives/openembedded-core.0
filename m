Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RdlQD-00007L-DJ
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 17:23:09 +0100
Received: from mail-gy0-f180.google.com ([209.85.160.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 22 Dec 2011 08:16:02 -0800
Received: by ghrr20 with SMTP id r20so2580955ghr.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 08:16:01 -0800 (PST)
Received: by 10.50.180.130 with SMTP id do2mr9585626igc.23.1324570561342;
	Thu, 22 Dec 2011 08:16:01 -0800 (PST)
Received: from [192.168.1.12] (c-76-115-40-64.hsd1.or.comcast.net.
	[76.115.40.64])
	by mx.google.com with ESMTPS id l28sm30543456ibc.3.2011.12.22.08.16.00
	(version=SSLv3 cipher=OTHER); Thu, 22 Dec 2011 08:16:00 -0800 (PST)
Message-ID: <4EF357D0.3030005@intel.com>
Date: Thu, 22 Dec 2011 08:16:16 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1324540322.git.sgw@linux.intel.com>
	<d4299e7c7d0c584cc0b1a0663111a9b328a73266.1324540323.git.sgw@linux.intel.com>
	<1324544544.4492.16.camel@lenovo.internal.reciva.com>
In-Reply-To: <1324544544.4492.16.camel@lenovo.internal.reciva.com>
Subject: Re: [CONSOLIDATED PULL 19/26] insane.bbclass: add QA tests for unsafe references to exec_prefix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Dec 2011 16:23:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2011 01:02 AM, Phil Blundell wrote:
> On Wed, 2011-12-21 at 23:55 -0800, Saul Wold wrote:
>> +		exec_prefix = d.getVar('exec_prefix', True)
>> +		sysroot_path = d.getVar('STAGING_DIR_TARGET', True)
>> +		sysroot_path_usr = sysroot_path + exec_prefix
>> +
>> +		try:
>> +			ldd_output = sub.check_output(["prelink-rtld", "--root", sysroot_path, path])
>> +		except sub.CalledProcessError as e:
>> +			if e.returncode != 127:
>> +				error_msg = pn + ": prelink-rtld aborted when processing %s" % path
>> +				package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
>> +				return False
>> +			else:
>> +				# Sometimes this is done deliberately (e.g, e2fsprogs), so only warn
>> +				bb.warn("%s has missing library dependencies" % path)
>> +				return
>> +		if sysroot_path_usr in ldd_output:
>> +			error_msg = pn + ": %s links to something under exec_prefix" % path
>> +			package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
>> +			error_msg = "ldd reports: %s" % ldd_output
>> +			package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
>> +			return False
>
> Is that going to do the right thing if ${prefix} == ${exec_prefix}?
> It's not obvious to me that it will handle that case correctly.

The function unsafe_references_skippable checks if exec_prefix == "" and 
also if base_bindir == bindir and base_sbindir == sbindir and 
base_libdir == libdir. Would that cover this case, or should this check 
be made explicit?

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


