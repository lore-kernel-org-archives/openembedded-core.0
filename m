Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 399D67839D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 01:34:26 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2017 17:34:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,438,1505804400"; 
   d="scan'208";a="4995638"
Received: from jlock-mobl2.ger.corp.intel.com (HELO [10.221.16.203])
	([10.221.16.203])
	by fmsmga004.fm.intel.com with ESMTP; 22 Nov 2017 17:34:25 -0800
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20171122160414.14093-1-ross.burton@intel.com>
	<20171122160414.14093-3-ross.burton@intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
Message-ID: <35dc23c8-a8af-65ca-8cdf-5152b76d98c0@linux.intel.com>
Date: Thu, 23 Nov 2017 09:34:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171122160414.14093-3-ross.burton@intel.com>
Subject: Re: [PATCH 3/3] oeqa/selftest/runtime_test: simplify postinst testing
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
X-List-Received-Date: Thu, 23 Nov 2017 01:34:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 23/11/2017 00:04, Ross Burton wrote:
> Update the packages and file names to reflect the new postinst recipe.
> 
> Fix a sh syntax error in the run_serial file exists test which was hidden by a
> logic problem in the status code.
> 
> Remove the older test_verify_postinst as it's effectively a subset of
> test_postinst_rootfs_and_boot, and doesn't work: when booting under systemd the
> strings it searches for are not output to the console, but the test still
> passes.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/lib/oeqa/selftest/cases/runtime_test.py | 82 +++++++---------------------
>   1 file changed, 19 insertions(+), 63 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
> index 25270b7535b..1c69255b568 100644
> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> @@ -167,55 +167,6 @@ class TestImage(OESelftestTestCase):
>   
>   class Postinst(OESelftestTestCase):
>       @OETestID(1540)

We're effectively stating that test ID 1540 and test ID 1545 are both 
covered by the same test method, right?

Perhaps we don't need to maintain both test cases in Testopia, as we'll 
only ever see both tests pass or fail?

> -    def test_verify_postinst(self):
> -        """
> -        Summary: The purpose of this test is to verify the execution order of postinst Bugzilla ID: [5319]
> -        Expected :
> -        1. Compile a minimal image.
> -        2. The compiled image will add the created layer with the recipes postinst[ abdpt]
> -        3. Run qemux86
> -        4. Validate the task execution order
> -        Author: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
> -        """
> -        features = 'INHERIT += "testimage"\n'
> -        features += 'CORE_IMAGE_EXTRA_INSTALL += "postinst-at-rootfs \
> -postinst-delayed-a \
> -postinst-delayed-b \
> -postinst-delayed-d \
> -postinst-delayed-p \
> -postinst-delayed-t \
> -"\n'
> -        self.write_config(features)
> -
> -        bitbake('core-image-minimal -f ')
> -
> -        postinst_list = ['100-postinst-at-rootfs',
> -                         '101-postinst-delayed-a',
> -                         '102-postinst-delayed-b',
> -                         '103-postinst-delayed-d',
> -                         '104-postinst-delayed-p',
> -                         '105-postinst-delayed-t']
> -        path_workdir = get_bb_var('WORKDIR','core-image-minimal')
> -        workspacedir = 'testimage/qemu_boot_log'
> -        workspacedir = os.path.join(path_workdir, workspacedir)
> -        rexp = re.compile("^Running postinst .*/(?P<postinst>.*)\.\.\.$")
> -        with runqemu('core-image-minimal') as qemu:
> -            with open(workspacedir) as f:
> -                found = False
> -                idx = 0
> -                for line in f.readlines():
> -                    line = line.strip().replace("^M","")
> -                    if not line: # To avoid empty lines
> -                        continue
> -                    m = rexp.search(line)
> -                    if m:
> -                        self.assertEqual(postinst_list[idx], m.group('postinst'), "Fail")
> -                        idx = idx+1
> -                        found = True
> -                    elif found:
> -                        self.assertEqual(idx, len(postinst_list), "Not found all postinsts")
> -                        break
> -
>       @OETestID(1545)
>       def test_postinst_rootfs_and_boot(self):
>           """
> @@ -234,16 +185,22 @@ postinst-delayed-t \
>                           for initialization managers: sysvinit and systemd.
>   
>           """
> -        file_rootfs_name = "this-was-created-at-rootfstime"
> -        fileboot_name = "this-was-created-at-first-boot"
> -        rootfs_pkg = 'postinst-at-rootfs'
> -        boot_pkg = 'postinst-delayed-a'
> +
> +        import oe.path
> +
> +        vars = get_bb_vars(("IMAGE_ROOTFS", "sysconfdir"), "core-image-minimal")
> +        rootfs = vars["IMAGE_ROOTFS"]
> +        self.assertIsNotNone(rootfs)
> +        sysconfdir = vars["sysconfdir"]
> +        self.assertIsNotNone(sysconfdir)
> +        # Need to use oe.path here as sysconfdir starts with /
> +        hosttestdir = oe.path.join(rootfs, sysconfdir, "postinst-test")
> +        targettestdir = os.path.join(sysconfdir, "postinst-test")
>   
>           for init_manager in ("sysvinit", "systemd"):
>               for classes in ("package_rpm", "package_deb", "package_ipk"):
>                   with self.subTest(init_manager=init_manager, package_class=classes):
> -                    features = 'MACHINE = "qemux86"\n'
> -                    features += 'CORE_IMAGE_EXTRA_INSTALL += "%s %s "\n'% (rootfs_pkg, boot_pkg)
> +                    features = 'CORE_IMAGE_EXTRA_INSTALL = "postinst-delayed-b"\n'
>                       features += 'IMAGE_FEATURES += "package-management empty-root-password"\n'

The indentation doesn't look right here?

>                       features += 'PACKAGE_CLASSES = "%s"\n' % classes
>                       if init_manager == "systemd":
> @@ -255,13 +212,12 @@ postinst-delayed-t \
>   
>                       bitbake('core-image-minimal')
>   
> -                    file_rootfs_created = os.path.join(get_bb_var('IMAGE_ROOTFS', "core-image-minimal"),
> -                                                       file_rootfs_name)
> -                    found = os.path.isfile(file_rootfs_created)
> -                    self.assertTrue(found, "File %s was not created at rootfs time by %s" % \
> -                                    (file_rootfs_name, rootfs_pkg))
> +                    self.assertTrue(os.path.isfile(os.path.join(hosttestdir, "rootfs")),
> +                                    "rootfs state file was not created")
>   
> -                    testcommand = 'ls /etc/' + fileboot_name
>                       with runqemu('core-image-minimal') as qemu:
> -                        status, output = qemu.run_serial("-f /etc/" + fileboot_name)
> -                        self.assertEqual(status, 0, 'File %s was not created at first boot (%s)' % (fileboot_name, output))
> +                        # Make the test echo a string and search for that as
> +                        # run_serial()'s status code is useless.'
> +                        for filename in ("rootfs", "delayed-a", "delayed-b"):
> +                            status, output = qemu.run_serial("test -f %s && echo found" % os.path.join(targettestdir, filename))
> +                            self.assertEqual(output, "found", "%s was not present on boot" % filename)
> 

Why not just test the status (return code of test -f) instead of echoing 
a known value? i.e.

self.assertEqual(status, 0, "%s was not present on boot" % filename)

Joshua

