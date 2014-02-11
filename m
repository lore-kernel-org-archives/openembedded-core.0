Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 8BBBB6EE16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 08:42:56 +0000 (UTC)
Received: from [172.16.141.133] (172.16.141.133) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 11 Feb 2014 09:42:50 +0100
Message-ID: <52F9E289.2080002@enea.com>
Date: Tue, 11 Feb 2014 09:42:49 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1391427313.git.laurentiu.palcu@intel.com>
	<cover.1392034327.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1392034327.git.laurentiu.palcu@intel.com>
X-Originating-IP: [172.16.141.133]
Subject: Re: [PATCH v5 00/53] Rootfs/image generation refactoring (cover letter only)
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
X-List-Received-Date: Tue, 11 Feb 2014 08:42:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-02-10 13:15, Laurentiu Palcu wrote:
> V5:
>   * dump command output in case errors occur;
>
> V4:
>   * fix multilib build issue for RPM backend;
>
> V3:
>   * add simple check to just return if we're attempting to install packages and
>     the list is empty;
>
> V2:
>   * fix building from feeds for opkg;
>   * rebase;
>

When stubbing license manifest creation for the FEEDS functionality:

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c668783..a0413b9 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -26,6 +26,12 @@ python write_package_manifest() {
  }

  license_create_manifest() {
+        # Test if BUILD_IMAGES_FROM_FEEDS is defined in env
+       echo ${BUILD_IMAGES_FROM_FEEDS}
+       if [ -n "${BUILD_IMAGES_FROM_FEEDS}" ]; then
+          exit 0
+       fi
+


I get this error message on v5.

Br,
David


$ bitbake -c rootfs core-image-minimal
Parsing recipes: 100% 
|######################################################################################################################################################################| 
Time: 00:00:12
Parsing of 852 .bb files complete (0 cached, 852 parsed). 1212 targets, 
56 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.21.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-13.10"
TARGET_SYS        = "powerpc-poky-linux"
MACHINE           = "qemuppc"
DISTRO            = "poky"
DISTRO_VERSION    = "1.5+snapshot-20140211"
TUNE_FEATURES     = "m32 fpu-hard ppc7400 altivec"
TARGET_FPU        = ""
meta
meta-yocto
meta-yocto-bsp    = 
"(detachedfromFETCH_HEAD):20104ecbb94a1ada0cb3a26c7801b56a897dc900"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks

ERROR: Error executing a python function in 
/media/sdb5/poky-contrib/meta/recipes-core/images/core-image-minimal.bb:

The stack trace of python calls that resulted in this exception/failure was:
File: 'do_rootfs', lineno: 17, function: <module>
      0013:    # generate final images
      0014:    create_image(d)
      0015:
      0016:
  *** 0017:do_rootfs(d)
      0018:
File: 'do_rootfs', lineno: 14, function: do_rootfs
      0010:    # generate rootfs
      0011:    create_rootfs(d)
      0012:
      0013:    # generate final images
  *** 0014:    create_image(d)
      0015:
      0016:
      0017:do_rootfs(d)
      0018:
File: '/media/sdb5/poky-contrib/meta/lib/oe/image.py', lineno: 231, 
function: create_image
      0227:        execute_pre_post_process(self.d, post_process_cmds)
      0228:
      0229:
      0230:def create_image(d):
  *** 0231:    Image(d).create()
      0232:
      0233:if __name__ == "__main__":
      0234:    """
      0235:    Image creation can be called independent from bitbake 
environment.
File: '/media/sdb5/poky-contrib/meta/lib/oe/image.py', lineno: 210, 
function: create
      0206:        execute_pre_post_process(self.d, pre_process_cmds)
      0207:
      0208:        self._remove_old_symlinks()
      0209:
  *** 0210:        image_cmds = self._get_imagecmds()
      0211:
      0212:        # create the images in parallel
      0213:        nproc = multiprocessing.cpu_count()
      0214:        pool = bb.utils.multiprocessingpool(nproc)
File: '/media/sdb5/poky-contrib/meta/lib/oe/image.py', lineno: 195, 
function: _get_imagecmds
      0191:                cmds.append(localdata.expand("\trm 
${IMAGE_NAME}.rootfs.${type}"))
      0192:            else:
      0193:                subimages.append(type)
      0194:
  *** 0195:            script_name = self._write_script(type, cmds)
      0196:
      0197:            image_cmds.append((type, subimages, script_name))
      0198:
      0199:        return image_cmds
File: '/media/sdb5/poky-contrib/meta/lib/oe/image.py', lineno: 158, 
function: _write_script
      0154:        self.d.setVarFlag('img_creation_func', 'func', 1)
      0155:        self.d.setVarFlag('img_creation_func', 'fakeroot', 1)
      0156:
      0157:        with open(script_name, "w+") as script:
  *** 0158:            script.write("%s" % bb.build.shell_trap_code())
      0159:            script.write("export ROOTFS_SIZE=%d\n" % 
self._get_rootfs_size())
      0160:            bb.data.emit_func('img_creation_func', script, 
self.d)
      0161:            script.write("img_creation_func\n")
      0162:
Exception: AttributeError: 'module' object has no attribute 
'shell_trap_code'

ERROR: Function failed: do_rootfs
ERROR: Logfile of failure stored in: 
/media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.9994
ERROR: Task 6 
(/media/sdb5/poky-contrib/meta/recipes-core/images/core-image-minimal.bb, do_rootfs) 
failed with exit code '1'




