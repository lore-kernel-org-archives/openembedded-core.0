Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1UdHTn-0000zr-DM
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 12:01:53 +0200
Received: from atl4mhob13.myregisteredsite.com
	(atl4mhob13.myregisteredsite.com [209.17.115.51])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r4H9hPmc021018 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 05:43:25 -0400
Received: from mail.hostingplatform.com ([10.30.71.206])
	by atl4mhob13.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r4H9hNA5020166 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 05:43:23 -0400
Received: (qmail 26765 invoked by uid 0); 17 May 2013 09:43:23 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 17 May 2013 09:43:23 -0000
Message-ID: <5195FBBA.6030309@topic.nl>
Date: Fri, 17 May 2013 11:43:22 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1368689187-4714-1-git-send-email-xiao.zhang@windriver.com>
	<1368689187-4714-2-git-send-email-xiao.zhang@windriver.com>
	<5194AE0D.8030508@windriver.com> <5195D693.9090003@linux.intel.com>
In-Reply-To: <5195D693.9090003@linux.intel.com>
Subject: package_write_ipk somehow looks into the wrong path
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
X-List-Received-Date: Fri, 17 May 2013 10:02:05 -0000
X-Groupsio-MsgNum: 39372
Content-Type: multipart/mixed; boundary="------------010908010104070701050608"

--------------010908010104070701050608
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


I got this very weird build failure. It builds fine for one machine 
(zedboard), but it craps out in a really weird way on the "zynq-zc702" 
machine.

Somehow the "package_write_ipk" task wants to find files in a directory 
with "1-r0" (a version that has once existed a long long time ago) in 
the version part, instead of the proper git hashed name.

I've tried a "cleansstate" but that did not help. The "compile" step in 
this recipe takes about 1,5 hour on my i7 system, so debugging this 
recipe is painfully slow...

I've attached the recipes, pasted the log below.




mike@paradigit:~/zynq/build$ nice -n 15 bitbake my-image
Loading cache: 100% |###########################################| ETA: 
00:00:00
Loaded 1907 entries from dependency cache.
Parsing recipes: 100% |#########################################| Time: 
00:00:00
Parsing of 1517 .bb files complete (1514 cached, 3 parsed). 1909 
targets, 115 skipped, 0 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.17.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-11.10"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "zynq-zc702"
DISTRO            = "tiny"
DISTRO_VERSION    = "oe-core.0"
TUNE_FEATURES     = "armv7a vfp neon"
TARGET_FPU        = "vfp-neon"
meta              = "master:a3c1e0f4e519921a692a5f4d1268a4eb249b1b03"
meta-oe
toolchain-layer
meta-efl
meta-gpe
meta-gnome
meta-xfce
meta-multimedia   = "master:3dcea929763e6a3233dbe620920f02682b28bb8d"
meta-zynq         = "master:7458ae3d3007c8159152a930a7f40991c1725240"
meta-topic        = "master:860265ec025e9c7f05acd0778591cc9390a39e6c"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Error executing a python function in 
/home/mike/zynq/meta-zynq/recipes-bsp/fpga/fpga-image.bb:
OSError: [Errno 2] No such file or directory: 
'/home/mike/zynq/build/tmp-eglibc/work/zynq-zc702-oe-linux-gnueabi/fpga-image/1-r0/packages-split/fpga-image'

ERROR: The stack trace of python calls that resulted in this 
exception/failure was:
ERROR:   File "do_package_ipk", line 194, in <module>
ERROR:
ERROR:   File "do_package_ipk", line 45, in do_package_ipk
ERROR:
ERROR: The code that was being executed was:
ERROR:      0190:        bb.utils.unlockfile(lf)
ERROR:      0191:
ERROR:      0192:
ERROR:      0193:
ERROR:  *** 0194:do_package_ipk(d)
ERROR:      0195:
ERROR: [From file: 'do_package_ipk', lineno: 194, function: <module>]
ERROR:      0041:        basedir = os.path.join(os.path.dirname(root))
ERROR:      0042:        arch = localdata.getVar('PACKAGE_ARCH', True)
ERROR:      0043:        pkgoutdir = "%s/%s" % (outdir, arch)
ERROR:      0044:        bb.mkdirhier(pkgoutdir)
ERROR:  *** 0045:        os.chdir(root)
ERROR:      0046:        from glob import glob
ERROR:      0047:        g = glob('*')
ERROR:      0048:        try:
ERROR:      0049:            del g[g.index('CONTROL')]
ERROR: [From file: 'do_package_ipk', lineno: 45, function: do_package_ipk]
ERROR: Function failed: do_package_ipk
ERROR: Execution of event handler 'run_buildstats' failed
Traceback (most recent call last):
   File "run_buildstats(e)", line 103, in 
run_buildstats(e=<bb.build.TaskFailed object at 0x1575ca90>)
   File "buildstats.bbclass", line 5, in 
write_task_data(status='failed', 
logfile='/home/mike/zynq/build/tmp-eglibc/buildstats/my-image-zynq-zc702/201305171106/fpga-image-1-r0/do_package_write_ipk', 
dev='sda5', e=<bb.build.TaskFailed object at 0x1575ca90>)
IOError: [Errno 2] No such file or directory: 
'/home/mike/zynq/build/tmp-eglibc/buildstats/my-image-zynq-zc702/201305171106/fpga-image-1-r0/do_package_write_ipk'

ERROR: Logfile of failure stored in: 
/home/mike/zynq/build/tmp-eglibc/work/zynq-zc702-oe-linux-gnueabi/fpga-image/2.AUTOINC-8095d780aab8d110298d655852f8f31053f5f124-r0/temp/log.do_package_write_ipk.5262
ERROR: Task 335 
(/home/mike/zynq/meta-zynq/recipes-bsp/fpga/fpga-image.bb, 
do_package_write_ipk) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1836 tasks of which 1799 didn't need to 
be rerun and 1 failed.
No currently running tasks (1836 of 1840)

Summary: 1 task failed:
   /home/mike/zynq/meta-zynq/recipes-bsp/fpga/fpga-image.bb, 
do_package_write_ipk
Summary: There were 26 ERROR messages shown, returning a non-zero exit code.


--------------010908010104070701050608
Content-Type: text/plain; charset=UTF-8;
 name="fpga-design.inc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="fpga-design.inc"

TElDRU5TRSA9ICJHUEx2MiIKTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vJHtDT1JFQkFTRX0v
TElDRU5TRTttZDU9M2Y0MGQ3OTk0Mzk3MTA5Mjg1ZWM3YjgxZmRlYjNiNTgiCiMgUGFja2FnZSBp
cyBtYWNoaW5lIHNwZWNpZmljClBBQ0tBR0VfQVJDSCA9ICIke01BQ0hJTkV9IgoKIyBXb3JrYXJv
dW5kOiBYUFMgZmFpbHMgdG8gYnVpbGQgd2hlbiB0aGVyZSdzIGEgIisiIGluIHRoZSBwYXRoLgpT
UkNQVl9OT1BMVVMgPSAiJHtAZC5nZXRWYXIoJ1NSQ1BWJyxUcnVlKS5yZXBsYWNlKCcrJywnLScp
fSIKClM9IiR7V09SS0RJUn0vZ2l0IgoKQk9BUkRfREVTSUdOX1VSSSA/PSAiIgoKQk9BUkRfREVT
SUdOX1VSSV96ZWRib2FyZCA9ICJnaXQ6Ly9naXRodWIuY29tL21pbG9zb2Z0d2FyZS96eW5xLXpl
ZGJvYXJkLWxvZ2ljLmdpdCIKU1JDUkVWX2JvYXJkLXplZGJvYXJkID0gIjYzZTMxNzE2NDM1N2Jm
ODdiYmE3ZGQwYWRjNDI5ZDRjOTFhNzhjZmYiCgpCT0FSRF9ERVNJR05fVVJJX3p5bnEtemM3MDIg
PSAiZ2l0Oi8vZ2l0aHViLmNvbS9taWxvc29mdHdhcmUvenlucS16YzcwMi1sb2dpYy5naXQiClNS
Q1JFVl9ib2FyZC16eW5xLXpjNzAyID0gIjgwOTVkNzgwYWFiOGQxMTAyOThkNjU1ODUyZjhmMzEw
NTNmNWYxMjQiCgpTUkNfVVJJID0gIlwKCSR7Qk9BUkRfREVTSUdOX1VSSX07bmFtZT1ib2FyZC0k
e01BQ0hJTkV9IFwKCWh0dHA6Ly93aWtpLmFuYWxvZy5jb20vX21lZGlhL3Jlc291cmNlcy9mcGdh
L3hpbGlueC9rYzcwNS9jZl9hZHY3NTExX3plZF9lZGtfMTRfNF8yMDEzXzAyXzA1LnRhci5nejtu
YW1lPXZoZGwgXAoJIgoKU1JDX1VSSVt2aGRsLm1kNXN1bV0gPSAiN2JmYTk5ZjU3NmUwZjRhNDBk
NmZjMzBjMmUxMTE0NzAiClNSQ19VUklbdmhkbC5zaGEyNTZzdW1dID0gIjRkZWEyZGMwYzMyZGE4
NTU2Yzg4ZTI5OTM1MDk2NDgxNmI2NzU5M2QyM2ViNTkwZmI2MjM5M2NlNjIyMjlmMDkiCgo=

--------------010908010104070701050608
Content-Type: text/plain; charset=UTF-8;
 name="fpga-image.bb"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="fpga-image.bb"

REVTQ1JJUFRJT04gPSAiRlBHQSBiaXQgaW1hZ2UgbG9hZGVyIGZyb20gdXNlcnNwYWNlIGFuZCB0
b29scyIKREVQRU5EUyA9ICJweXRob24tbmF0aXZlIgoKcmVxdWlyZSBmcGdhLWRlc2lnbi5pbmMK
ClBWID0gIjIuJHtTUkNQVl9OT1BMVVN9IgpQUiA9ICJyMCIKClBBQ0tBR0VTID0gIiR7UE59IgoK
Uz0iJHtXT1JLRElSfS9naXQiCgpTUkNfVVJJICs9ICJcCglmaWxlOi8vZnBnYS1iaXQtdG8tYmlu
LnB5IFwKCWZpbGU6Ly9pbml0IFwKCSIKCmluaGVyaXQgdXBkYXRlLXJjLmQKCiMgU2V0IHRvIHN0
YXJ0IGF0IDAzLCB3aGljaCBpcyBiZWZvcmUgbW9kdXRpbHMKIyBzbyB5b3UgY2FuIGF1dG9sb2Fk
IG1vZHVsZXMgd2hpY2ggdXNlIEZQR0EgbG9naWMuCklOSVRTQ1JJUFRfTkFNRSA9ICIke1BOfS5z
aCIKSU5JVFNDUklQVF9QQVJBTVMgPSAic3RhcnQgMDMgUyAuIgoKZG9fY29tcGlsZSgpIHsKCWV4
cG9ydCBMTV9MSUNFTlNFX0ZJTEU9IiR7WElMSU5YX0xNX0xJQ0VOU0VfRklMRX0iCglzb3VyY2Ug
JHtYSUxJTlhfVE9PTF9QQVRIfS9JU0VfRFMvc2V0dGluZ3Mke1hJTElOWF9UT09MX0FSQ0h9LnNo
Cgl4cHMgLW53IHN5c3RlbS54bXAgPDwgRU9GCnJ1biBiaXRzCnJ1biBleHBvcnR0b3NkawpFT0YK
CXB5dGhvbiAke1dPUktESVJ9L2ZwZ2EtYml0LXRvLWJpbi5weSAtLWZsaXAgJHtTfS9pbXBsZW1l
bnRhdGlvbi9zeXN0ZW0uYml0ICR7V09SS0RJUn0vZnBnYS5iaW4KfQoKRklMRVNfJHtQTn0gPSAi
JHtzeXNjb25mZGlyfSAke2RhdGFkaXJ9Igpkb19pbnN0YWxsKCkgewoJaW5zdGFsbCAtZCAke0R9
JHtzeXNjb25mZGlyfQoJaW5zdGFsbCAtZCAke0R9JHtzeXNjb25mZGlyfS9pbml0LmQKCWluc3Rh
bGwgLW0gNzU1ICR7V09SS0RJUn0vaW5pdCAke0R9JHtzeXNjb25mZGlyfS9pbml0LmQvJHtQTn0u
c2gKCWluc3RhbGwgLWQgJHtEfSR7ZGF0YWRpcn0KCWluc3RhbGwgLW0gNjQ0ICR7V09SS0RJUn0v
ZnBnYS5iaW4gJHtEfSR7ZGF0YWRpcn0vZnBnYS5iaW4KfQoKIyBTdG9yZSB0aGUgU0RLIGZpbGVz
IGludG8gdGhlIHN5c3Jvb3QgZm9yIG90aGVyIHBhY2thZ2VzClNZU1JPT1RfUFJFUFJPQ0VTU19G
VU5DUyArPSAiZnBnYV9zeXNyb290X3ByZXByb2Nlc3MiCmZwZ2Ffc3lzcm9vdF9wcmVwcm9jZXNz
KCkgewoJaW5zdGFsbCAtZCAke1NZU1JPT1RfREVTVERJUn0ke2RhdGFkaXJ9L3hpbGlueF9zZGsK
CWNwIC1yICR7U30vU0RLL1NES19FeHBvcnQvaHcvKiAke1NZU1JPT1RfREVTVERJUn0ke2RhdGFk
aXJ9L3hpbGlueF9zZGsvCn0K

--------------010908010104070701050608--
