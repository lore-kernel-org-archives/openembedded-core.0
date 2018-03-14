Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A998788B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 03:17:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2E3Gtt6013807
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Mar 2018 20:16:55 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.163.240) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 13 Mar 2018 20:16:55 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1520911259.git.liezhi.yang@windriver.com>
	<b99839985653f44516cf41291681f2f5cbf63a7e.1520911259.git.liezhi.yang@windriver.com>
	<1520953029.25754.7.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <d4f53fca-f339-bc2b-ab2d-0c4e2b70a065@windriver.com>
Date: Wed, 14 Mar 2018 11:18:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520953029.25754.7.camel@linuxfoundation.org>
Subject: Re: [PATCH 7/8] populate_sdk_ext.bbclass: remove the try...finally
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
X-List-Received-Date: Wed, 14 Mar 2018 03:17:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 03/13/2018 10:57 PM, Richard Purdie wrote:
> On Tue, 2018-03-13 at 11:24 +0800, Robert Yang wrote:
>> The "sdkbasepath + '/conf/local.conf.bak" doesn't exist when
>> "oe.copy_buildsystem.check_sstate_task_list()" fails, then
>> os.replace() would
>> raise FileNotFoundError, which overcomes the real error. Keep the
>> error status
>> makes debug easier, so remove the try..finally.
> 
> I don't think this patch is quite right. If there is a failure we
> *must* make sure local.conf is restored, that is important. The code
> should probably keep the try/finally but make the replace conditional
> on the file existing.

Thanks, updated in the repo:

Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Wed Mar 14 10:01:51 2018 +0800

     populate_sdk_ext.bbclass: only replace local.conf when local.conf.bak exists

     The "sdkbasepath + '/conf/local.conf.bak'" doesn't exist when
     "oe.copy_buildsystem.check_sstate_task_list()" fails since the sdkbasepath had
     been renamed to temp_sdkbasepath, but can't rename back when
     oe.copy_buildsystem.check_sstate_task_list() fails, then os.replace() would
     raise FileNotFoundError, which overcomes the real error. Only replace
     local.conf when local_conf.bak exists can make the debug easier.

     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

diff --git a/meta/classes/populate_sdk_ext.bbclass 
b/meta/classes/populate_sdk_ext.bbclass
index 057c495..fa24fc4 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -141,9 +141,11 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, 
conf_initpath):
      import oe.copy_buildsystem

      # Create a temporary build directory that we can pass to the env setup script
-    shutil.copyfile(sdkbasepath + '/conf/local.conf', sdkbasepath + 
'/conf/local.conf.bak')
+    local_conf = sdkbasepath + '/conf/local.conf'
+    local_conf_bak = local_conf + '.bak'
+    shutil.copyfile(local_conf, local_conf_bak)
      try:
-        with open(sdkbasepath + '/conf/local.conf', 'a') as f:
+        with open(local_conf, 'a') as f:
              # Force the use of sstate from the build system
              f.write('\nSSTATE_DIR_forcevariable = "%s"\n' % 
d.getVar('SSTATE_DIR'))
              f.write('SSTATE_MIRRORS_forcevariable = "file://universal/(.*) 
file://universal-4.9/\\1 file://universal-4.9/(.*) file://universal-4.8/\\1"\n')
@@ -178,7 +180,8 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, 
conf_initpath):
          # will effectively do
          clean_esdk_builddir(d, sdkbasepath)
      finally:
-        os.replace(sdkbasepath + '/conf/local.conf.bak', sdkbasepath + 
'/conf/local.conf')
+        if os.path.exists(local_conf_bak):
+            os.replace(local_conf_bak, local_conf)

  python copy_buildsystem () {
      import re

// Robert


> 
> Cheers,
> 
> Richard
> 

