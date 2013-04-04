Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UNjKX-0002xS-92
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 14:31:49 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 6AB60D22E9; Thu,  4 Apr 2013 14:14:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 3DF72D20D2;
	Thu,  4 Apr 2013 14:14:12 +0200 (CEST)
Message-ID: <515D6E8B.3070201@linaro.org>
Date: Thu, 04 Apr 2013 14:14:03 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <51493825.5050802@linux.intel.com>
	<1363770696-2908-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<515C4FC5.70808@linux.intel.com> <515C954A.3000109@linaro.org>
	<515C983E.20007@linux.intel.com>
In-Reply-To: <515C983E.20007@linux.intel.com>
X-Enigmail-Version: 1.4.6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] elfutils: split libraries into separate packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2013 12:31:50 -0000
X-Groupsio-MsgNum: 37416
Content-Type: multipart/mixed; boundary="------------040501090101060607080108"

--------------040501090101060607080108
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 03.04.2013 22:59, Saul Wold pisze:
> On 04/03/2013 01:47 PM, Marcin Juszkiewicz wrote:
>> W dniu 03.04.2013 17:50, Saul Wold pisze:
>>> This change seems to cause some issues with multilib build with lib32 on
>>> x86-64:
>>
>> I have to admit that I never did any multilib builds with OE. Can you
>> point me to config options I need to set to get such build done?
>>
>>
> 
> Sure set the following in your local.conf:
> 
> MACHINE = "qemux86-64"
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> 
> 
> bitbake lib32-elfutils

Never mind do I use gcc-4.7 or gcc-linaro-4.7 it fails (conf/site.conf
attached):

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Error executing a python function in
/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-devtools/gcc/libgcc_4.7.bb:
NameError: global name 'get_tune_parameters' is not defined

ERROR: The stack trace of python calls that resulted in this
exception/failure was:
ERROR:   File "do_multilib_install", line 64, in <module>
ERROR:
ERROR:   File "do_multilib_install", line 17, in do_multilib_install
ERROR:
ERROR: The code that was being executed was:
ERROR:      0060:            os.unlink(dest)
ERROR:      0061:        os.symlink(src, dest)
ERROR:      0062:
ERROR:      0063:
ERROR:  *** 0064:do_multilib_install(d)
ERROR:      0065:
ERROR: [From file: 'do_multilib_install', lineno: 64, function: <module>]
ERROR:      0013:        return
ERROR:      0014:
ERROR:      0015:    if mlprefix:
ERROR:      0016:        orig_tune =
d.getVar('DEFAULTTUNE_MULTILIB_ORIGINAL', True)
ERROR:  *** 0017:        orig_tune_params =
get_tune_parameters(orig_tune, d)
ERROR:      0018:        orig_tune_baselib = orig_tune_params['baselib']
ERROR:      0019:        orig_tune_bitness =
orig_tune_baselib.replace('lib', '')
ERROR:      0020:        if not orig_tune_bitness:
ERROR:      0021:            orig_tune_bitness = '32'
ERROR: [From file: 'do_multilib_install', lineno: 17, function:
do_multilib_install]
ERROR: Function failed: do_multilib_install
ERROR: Logfile of failure stored in:
/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/x86-oemllib32-linux/lib32-libgcc/4.7.2-r13/temp/log.do_multilib_install.9501
ERROR: Task 679
(virtual:multilib:lib32:/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-devtools/gcc/libgcc_4.7.bb,
do_multilib_install) failed with exit code '1'
NOTE: Tasks Summary: Attempted 924 tasks of which 923 didn't need to be
rerun and 1 failed.
No currently running tasks (461 of 1042)

Summary: 1 task failed:

virtual:multilib:lib32:/home/hrw/HDD/devel/canonical/aarch64/openembedded/repos/openembedded-core/meta/recipes-devtools/gcc/libgcc_4.7.bb,
do_multilib_install
Summary: There were 25 ERROR messages shown, returning a non-zero exit code.


--------------040501090101060607080108
Content-Type: text/plain; charset=UTF-8;
 name="site.conf"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="site.conf"

U0NPTkZfVkVSU0lPTiA9ICIxIgojIHNwZWNpZnkgdGhlIGFsaWdubWVudCBvZiB0aGUgcm9vdCBm
aWxlIHN5c3RlbQojIHRoaXMgaXMgcmVxdWlyZWQgd2hlbiBidWlsZGluZyBmb3IgcWVtdWFybXY3
YQpJTUFHRV9ST09URlNfQUxJR05NRU5UID0gIjIwNDgiCgpCQl9HRU5FUkFURV9NSVJST1JfVEFS
QkFMTFMgPSAiVHJ1ZSIKI01BQ0hJTkUgPz0gImdlbmVyaWNhcm12OCIKQkJfTlVNQkVSX1RIUkVB
RFMgPSAiMTgiClBBUkFMTEVMX01BS0UgPSAiLWo4IgpJTUFHRV9GU1RZUEVTID0gInRhci5neiBl
eHQyIgpTT1VSQ0VfTUlSUk9SX1VSTCA9ICJodHRwOi8vc25hcHNob3RzLmxpbmFyby5vcmcvb3Bl
bmVtYmVkZGVkL3NvdXJjZXMvIgpJTkhFUklUICs9ICJvd24tbWlycm9ycyIKCkRMX0RJUiA9ICIv
aG9tZS9ocncvZGV2ZWwvc291cmNlcy9vZSIKCklOSEVSSVQgKz0gInJtX3dvcmsiCgojIFNPVVJD
RV9BUkNISVZFX1BBQ0tBR0VfVFlQRSA9ICJ0YXIiCiMgU09VUkNFX0FSQ0hJVkVfTE9HX1dJVEhf
U0NSSVBUUyA9ICJsb2dzX3dpdGhfc2NyaXB0cyIKIyBJTkhFUklUICs9ICJhcmNoaXZlLW9yaWdp
bmFsLXNvdXJjZSIKCiNHQ0NWRVJTSU9OICAgICAgID0gImxpbmFyby00LjciCiNTREtHQ0NWRVJT
SU9OICAgID0gImxpbmFyby00LjciCgojR0NDVkVSU0lPTiAgICAgICA9ICI0LjglIgojU0RLR0ND
VkVSU0lPTiAgICA9ICI0LjglIgoKQklOVVZFUlNJT04gICAgICA9ICIyLjIzLjEiCgpQUkVGRVJS
RURfUFJPVklERVJfbGliZXZlbnQgPSAibGliZXZlbnQtZmIiCgpMSUNFTlNFX0ZMQUdTX1dISVRF
TElTVCA9ICJDb21tZXJjaWFsIGNvbW1lcmNpYWwiCgojRElTVFJPX0ZFQVRVUkVTX2FwcGVuZCA9
ICIgcHRlc3QgIgoKCiMgY3Jvc3MgdG9vbGNoYWluIGZyb20gdGN3ZwojVENNT0RFID0gImV4dGVy
bmFsLWxpbmFybyIKI1RNUERJUiA9IHRtcC1leHRlcm5hbC1saW5hcm8KI0VMVF9UQVJHRVRfU1lT
ID0gImFhcmNoNjQtbGludXgtZ251IgojRVhURVJOQUxfVE9PTENIQUlOID0gIi9ob21lL2hydy9k
ZXZlbC9jYW5vbmljYWwvYWFyY2g2NC9vcGVuZW1iZWRkZWQvYnVpbGQvbGluYXJvLXRjd2cvZ2Nj
LWxpbmFyby1hYXJjaDY0LWxpbnV4LWdudS00LjctMjAxMy4wMy0yMDEzMDMxM19saW51eCIKCiMg
YXJtdjdhCiNFWFRFUk5BTF9UT09MQ0hBSU4gPSAiL2hvbWUvaHJ3L2RldmVsL2Nhbm9uaWNhbC9h
YXJjaDY0L29wZW5lbWJlZGRlZC9idWlsZC9saW5hcm8tdGN3Zy9nY2MtbGluYXJvLWFybS1saW51
eC1nbnVlYWJpaGYtNC43LTIwMTMuMDMtMjAxMzAzMTNfbGludXgiCiNNQUNISU5FID0gImdlbmVy
aWNhcm12N2EiCgpNQUNISU5FID0gInFlbXV4ODYtNjQiCnJlcXVpcmUgY29uZi9tdWx0aWxpYi5j
b25mCk1VTFRJTElCUyA9ICJtdWx0aWxpYjpsaWIzMiIKREVGQVVMVFRVTkVfdmlydGNsYXNzLW11
bHRpbGliLWxpYjMyID0gIng4NiIK

--------------040501090101060607080108--
