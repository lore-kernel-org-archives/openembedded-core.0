Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 6F4916013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 13:43:26 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id A00B1F811D8; Thu, 16 Jul 2015 07:43:26 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 21158F811D7;
	Thu, 16 Jul 2015 07:43:26 -0600 (MDT)
Message-ID: <55A7B509.5050100@mlbassoc.com>
Date: Thu, 16 Jul 2015 07:43:37 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Problem building sgml-common-native
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
X-List-Received-Date: Thu, 16 Jul 2015 13:43:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

After a Poky/Yocto repo refresh today, I'm now getting an
error when [re]building sgml-common-native:

| DEBUG: Staging files from 
/local/p0382-cutting-edge_2014-11-21/tmp/work/x86_64-linux/sgml-common-native/0.6.3-r1/sysroot-destdir/local/p0382-cutting-edge_2014-11-21/tmp/sysroots/x86_64-linux to 
/local/p0382-cutting-edge_2014-11-21/tmp/sysroots/x86_64-linux
| DEBUG: Executing shell function sgml_common_sstate_postinst
| install-catalog: addition of /local/p0382-cutting-edge_2014-11-21/tmp/sysroots/x86_64-linux/etc/sgml/sgml-ent.cat in 
/local/p0382-cutting-edge_2014-11-21/tmp/sysroots/x86_64-linux/etc/sgml/sgml-docbook.cat
| Warning: /local/p0382-cutting-edge_2014-11-21/tmp/sysroots/x86_64-linux/etc/sgml/sgml-ent.cat is already installed in the centralized catalog 
/local/p0382-cutting-edge_2014-11-21/tmp/sysroots/x86_64-linux/etc/sgml/sgml-docbook.cat
| install-catalog: addition of /local/p0382-cutting-edge_2014-11-21/tmp/sysroots/x86_64-linux/etc/sgml/sgml-docbook.cat in 
/local/p0382-cutting-edge_2014-11-21/tmp/sysroots/x86_64-linux/etc/sgml/catalog
| install-catalog: "/local/p0382-cutting-edge_2014-11-21/tmp/sysroots/x86_64-linux/etc/sgml/sgml-docbook-dtd-3.1.cat" does not exist or is empty.
| WARNING: exit code 2 from a shell command.
| DEBUG: Python function sstate_task_postfunc finished
| ERROR: Function failed: sgml_common_sstate_postinst (log file is located at 
/local/p0382-cutting-edge_2014-11-21/tmp/work/x86_64-linux/sgml-common-native/0.6.3-r1/temp/log.do_populate_sysroot.6449)
ERROR: Task 5213 (/local/poky-cutting-edge/meta/recipes-devtools/sgml-common/sgml-common-native_0.6.3.bb, do_populate_sysroot) failed with exit code '1'

This seems to contradict the latest change to this recipe:

   commit a0c83577cc108aaae8632fe44f0c1bd46995b264
   Author: Robert Yang <liezhi.yang@windriver.com>
   Date:   Tue Mar 18 15:54:34 2014 +0800
       sgml-common-native: fix the generation of sgml-docbook.cat

I think there must be some missing dependencies here - to fix it,
I had to manually clean these recipes:
   docbook-dsssl-stylesheets-native
   docbook-sgml-dtd-3.1-native
   openjade-native

Note: I'm not sure how my build got into this state.  I had built
in this tree successfully yesterday from
   poky-master:2578ff3dfe55a1c07208401861f96e2e327eacaf
today I'm using
   poky-master:ba07a69f3dc8fb798e372130bf665d059fed9d42

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

