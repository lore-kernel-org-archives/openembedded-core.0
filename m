Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A0F4260034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 17:55:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Mar 2015 10:55:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,417,1422950400"; d="scan'208";a="681446163"
Received: from swold-mobl.zpn.intel.com (HELO swold-mobl.amr.corp.intel.com)
	([10.219.16.68])
	by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2015 10:55:36 -0700
Message-ID: <55086A96.7060505@linux.intel.com>
Date: Tue, 17 Mar 2015 11:55:34 -0600
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1426556101-32053-1-git-send-email-sgw@linux.intel.com>
	<C27BBC55-806F-40DE-8CE4-1A43F8B975C5@gmail.com>
In-Reply-To: <C27BBC55-806F-40DE-8CE4-1A43F8B975C5@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] openssl: fix libssl.pc to use libcrypto
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
X-List-Received-Date: Tue, 17 Mar 2015 17:55:37 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2015 07:48 PM, Khem Raj wrote:
>
>> On Mar 16, 2015, at 6:35 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>> The 1.0.2 version of libssl requires that libcrypto be linked so don't
>> keep it private anymore.
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>> .../openssl/fix_Makefile_creation_of_libssl.patch        | 16 ++++++++++++++++
>> meta/recipes-connectivity/openssl/openssl_1.0.2.bb       |  1 +
>> 2 files changed, 17 insertions(+)
>> create mode 100644 meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.patch
>>
>> diff --git a/meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.patch b/meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.patch
>> new file mode 100644
>> index 0000000..e76ab2e
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/openssl/openssl/fix_Makefile_creation_of_libssl.patch
>> @@ -0,0 +1,16 @@
>> +Upstream-Status: Pending
>> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> +
>> +Index: openssl-1.0.2/Makefile.org
>> +===================================================================
>> +--- openssl-1.0.2.orig/Makefile.org
>> ++++ openssl-1.0.2/Makefile.org
>> +@@ -381,7 +381,7 @@ libssl.pc: Makefile
>> + 	    echo 'Description: Secure Sockets Layer and cryptography libraries'; \
>> + 	    echo 'Version: '$(VERSION); \
>> + 	    echo 'Requires.private: libcrypto'; \
>> +-	    echo 'Libs: -L$${libdir} -lssl'; \
>> ++	    echo 'Libs: -L$${libdir} -lssl -lcrypto'; \
>
> There must be a reason why upstream changed it to be private. What is the reason ?
> since reverting like this can have consequences, we need to understand this.
>
Ok drop this patch, it means that we need to fix the openflow recipe 
since it really is using APIs from both libssl and libcrypto which can 
be summed up by using the openssl.pc instead of trying to just use 
libssl.pc which was used because of history in openflow.

Patches to meta-oe will be forth coming for openflow to use openssl.pc 
and a pyopenssl upgrade.

Sorry for the noise here.

Sau!
>> + 	    echo 'Libs.private: $(EX_LIBS)'; \
>> + 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > libssl.pc
>> +
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
>> index 79537f9..a980855 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
>> @@ -37,6 +37,7 @@ SRC_URI += "file://configure-targets.patch \
>>              file://Makefiles-ptest.patch \
>>              file://ptest-deps.patch \
>>              file://run-ptest \
>> +            file://fix_Makefile_creation_of_libssl.patch \
>>             "
>>
>> SRC_URI[md5sum] = "38373013fc85c790aabf8837969c5eba"
>> --
>> 2.1.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

