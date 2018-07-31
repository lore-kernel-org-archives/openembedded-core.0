Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 87880745D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 09:55:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2018 02:55:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,426,1526367600"; d="scan'208";a="77446671"
Received: from pgsmsx106.gar.corp.intel.com ([10.221.44.98])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2018 02:55:40 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.206]) by
	PGSMSX106.gar.corp.intel.com ([169.254.9.57]) with mapi id
	14.03.0319.002; Tue, 31 Jul 2018 17:55:36 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [PATCH] test-result-log: testcase management tool to store and
	view test result
Thread-Index: AQHUKLJBAqMOJywbdEOFa73rwyf4e6SpEzpw
Date: Tue, 31 Jul 2018 09:55:36 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335E8868D@PGSMSX109.gar.corp.intel.com>
References: <1533028981-88677-1-git-send-email-ee.peng.yeoh@intel.com>
In-Reply-To: <1533028981-88677-1-git-send-email-ee.peng.yeoh@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMmNjYzFkNDQtMmNlYy00M2MzLTgwMjItZjUxMjY0ZDU5MTBhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTjlod1dneWR5MllneUI5UmMxdVhDaGp4SU5tK3gzeG1wZlc3ZWdxMnVcL1ZQYzI5MUtSME82S0EzSUtBdE5vZXUifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH] test-result-log: testcase management tool to store and view test result
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
X-List-Received-Date: Tue, 31 Jul 2018 09:55:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard & Paul & Ross,

As per our conversation in the past, there was a need to provide alternativ=
e testcase management tool to Testopia in order to achieve our goals of:
1) To unblocked Bugzilla upgrade to a newer version in order to receive the=
 improvement in WebServices, performance, and GUI. =20
2) To improve overall QA testing efficiency where it reduce maintenance cos=
t when Testopia need to manually synchronize the test case content between =
Testopia and the available automated test cases inside OEQA, also it minimi=
ze test execution rerun where someone need to retrieve test failure log inf=
ormation from previous QA cycle (Testopia does not store test log due to it=
s limitation on Testopia API for automation).

To provide alternative testcase management tool to Testopia, here was the f=
irst batch of patch target to enable storing test result for OEQA automated=
 testcase execution and view test summary report. There are another patch p=
lanned to enable manual test execution and store/view test result. =20

Please review this patch and provide us your valuable inputs and feedbacks.

Thank you very much for your attention!

Best regards,
Yeoh Ee Peng=20

-----Original Message-----
From: Yeoh, Ee Peng=20
Sent: Tuesday, July 31, 2018 5:23 PM
To: openembedded-core@lists.openembedded.org
Cc: Yeoh, Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH] test-result-log: testcase management tool to store and vie=
w test result

These scripts were developed as an alternative testcase management
tool to Testopia. Using these scripts, user can store test result
from OEQA automated testcase execution and view the test report.

These scripts will store test result & log in GIT repository and
show text-based summary report. To use these scripts, first source
oe environment, then run the entry point script to look for help
information.
    $ test-result-log

To store test result for OEQA automated testcase, execute the below
    $ test-result-log store-auto <folder-to-store> <git-branch> /
      <oeqa-log-file-location> <type-of-oeqa-testcase-executed>

To view summary test report, execute the below
    $ test-result-log view <git-branch>

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/testresultlog/gitstore.py              | 387 +++++++++++++++++=
++++
 scripts/lib/testresultlog/oeqalogparser.py         |  97 ++++++
 scripts/lib/testresultlog/oeqatestdiscover.py      |  65 ++++
 scripts/lib/testresultlog/storeauto.py             | 122 +++++++
 .../template/test_report_full_text.txt             |  33 ++
 .../test_report_include_idle_full_text.txt         |  33 ++
 scripts/lib/testresultlog/view.py                  | 198 +++++++++++
 scripts/test-result-log                            |  84 +++++
 8 files changed, 1019 insertions(+)
 create mode 100644 scripts/lib/testresultlog/gitstore.py
 create mode 100644 scripts/lib/testresultlog/oeqalogparser.py
 create mode 100644 scripts/lib/testresultlog/oeqatestdiscover.py
 create mode 100644 scripts/lib/testresultlog/storeauto.py
 create mode 100644 scripts/lib/testresultlog/template/test_report_full_tex=
t.txt
 create mode 100644 scripts/lib/testresultlog/template/test_report_include_=
idle_full_text.txt
 create mode 100644 scripts/lib/testresultlog/view.py
 create mode 100755 scripts/test-result-log

diff --git a/scripts/lib/testresultlog/gitstore.py b/scripts/lib/testresult=
log/gitstore.py
new file mode 100644
index 0000000..67f2749
--- /dev/null
+++ b/scripts/lib/testresultlog/gitstore.py
@@ -0,0 +1,387 @@
+import tempfile
+import os
+import pathlib
+import json
+import subprocess
+import shutil
+import scriptpath
+scriptpath.add_bitbake_lib_path()
+scriptpath.add_oe_lib_path()
+from oeqa.utils.git import GitRepo, GitError
+
+class GitStore(object):
+
+    def __init__(self):
+        self.script_path =3D os.path.dirname(os.path.realpath(__file__))
+        self.base_path =3D self.script_path + '/../../..'
+
+    def _create_temporary_workspace_dir(self):
+        return tempfile.mkdtemp(prefix=3D'testresultlog.')
+
+    def _remove_temporary_workspace_dir(self, workspace_dir):
+        return subprocess.run(["rm", "-rf",  workspace_dir])
+
+    def _get_project_environment_directory_path(self, project_dir, test_en=
vironment_list):
+        project_env_dir =3D project_dir
+        for env in test_environment_list:
+            project_env_dir =3D os.path.join(project_env_dir, env)
+        return project_env_dir
+
+    def _get_testmodule_list(self, testmodule_testsuite_dict):
+        return sorted(list(testmodule_testsuite_dict.keys()))
+
+    def _get_testcase_list(self, testsuite_list, testsuite_testcase_dict):
+        testcase_list =3D []
+        for testsuite in sorted(testsuite_list):
+            if testsuite in testsuite_testcase_dict:
+                for testcase in testsuite_testcase_dict[testsuite]:
+                    testcase_list.append(testcase)
+        return testcase_list
+
+    def _get_testcase_status(self, testcase, testcase_status_dict):
+        if testcase in testcase_status_dict:
+            return testcase_status_dict[testcase]
+        return ""
+
+    def _create_testcase_dict(self, testcase_list, testcase_status_dict):
+        testcase_dict =3D {}
+        for testcase in sorted(testcase_list):
+            #testcase_key =3D '%s.%s' % (testsuite_name, testcase)
+            testcase_status =3D self._get_testcase_status(testcase, testca=
se_status_dict)
+            testcase_dict[testcase] =3D {"testresult": testcase_status,"bu=
gs": ""}
+        #print('DEBUG: testcase_dict: %s' % testcase_dict)
+        return testcase_dict
+
+    def _create_testsuite_testcase_teststatus_json_object(self, testsuite_=
list, testsuite_testcase_dict, testcase_status_dict):
+        #print('DEBUG: creating testsuite testcase for testsuite list: %s'=
 % testsuite_list)
+        json_object =3D {'testsuite':{}}
+        testsuite_dict =3D json_object['testsuite']
+        for testsuite in sorted(testsuite_list):
+            testsuite_dict[testsuite] =3D {'testcase': {}}
+            #print('DEBUG: testsuite: %s' % testsuite)
+            #print('DEBUG: testsuite_testcase_dict[testsuite]: %s' % tests=
uite_testcase_dict[testsuite])
+            testsuite_dict[testsuite]['testcase'] =3D self._create_testcas=
e_dict(testsuite_testcase_dict[testsuite], testcase_status_dict)
+        return json_object
+
+    def _create_testsuite_json_formatted_string(self, testsuite_list, test=
suite_testcase_dict, testcase_status_dict):
+        testsuite_testcase_list =3D self._create_testsuite_testcase_testst=
atus_json_object(testsuite_list, testsuite_testcase_dict, testcase_status_d=
ict)
+        return json.dumps(testsuite_testcase_list, sort_keys=3DTrue, inden=
t=3D4)
+
+    def _write_testsuite_testcase_json_formatted_string_to_file(self, file=
_path, file_content):
+        with open(file_path, 'w') as the_file:
+            the_file.write(file_content)
+
+    def _write_log_file(self, file_path, logs):
+        with open(file_path, 'w') as the_file:
+            for line in logs:
+                the_file.write(line + '\n')
+
+    def _write_test_log_files(self, file_dir, testcase_list, testcase_logs=
_dict):
+        for testcase in testcase_list:
+            #print('testcase : %s' % testcase)
+            if testcase in testcase_logs_dict:
+                #print('testcase: %s' % testcase)
+                #print('testcase logs: %s' % testcase_logs_dict[testcase])
+                file_path =3D os.path.join(file_dir, '%s.log' % testcase)
+                self._write_log_file(file_path, testcase_logs_dict[testcas=
e])
+
+    def _copy_files_from_source_to_destination_dir(self, source_dir, desti=
nation_dir):
+        if os.path.exists(source_dir) and os.path.exists(destination_dir):
+            for item in os.listdir(source_dir):
+                s =3D os.path.join(source_dir, item)
+                d =3D os.path.join(destination_dir, item)
+                shutil.copy2(s, d)
+
+    def _create_automated_test_result_from_empty_git(self, git_dir, git_br=
anch, project, environment_list, testmodule_testsuite_dict, testsuite_testc=
ase_dict, testcase_status_dict, testcase_logs_dict):
+        workspace_dir =3D self._create_temporary_workspace_dir()
+        project_dir =3D os.path.join(workspace_dir, project)
+        project_env_dir =3D self._get_project_environment_directory_path(p=
roject_dir, environment_list)
+        pathlib.Path(project_env_dir).mkdir(parents=3DTrue, exist_ok=3DTru=
e)
+        for testmodule in self._get_testmodule_list(testmodule_testsuite_d=
ict):
+            testsuite_list =3D testmodule_testsuite_dict[testmodule]
+            module_json_structure =3D self._create_testsuite_json_formatte=
d_string(testsuite_list, testsuite_testcase_dict, testcase_status_dict)
+            file_name =3D '%s.json' % testmodule
+            file_path =3D os.path.join(project_env_dir, file_name)
+            self._write_testsuite_testcase_json_formatted_string_to_file(f=
ile_path, module_json_structure)
+            testcase_list =3D self._get_testcase_list(testsuite_list, test=
suite_testcase_dict)
+            self._write_test_log_files(project_env_dir, testcase_list, tes=
tcase_logs_dict)
+        self._push_testsuite_testcase_json_file_to_git_repo(workspace_dir,=
 git_dir, git_branch)
+        self._remove_temporary_workspace_dir(workspace_dir)
+
+    def _create_automated_test_result_from_existing_git(self, git_dir, git=
_branch, project, environment_list, testmodule_testsuite_dict, testsuite_te=
stcase_dict, testcase_status_dict, testcase_logs_dict):
+        project_dir =3D os.path.join(git_dir, project)
+        project_env_dir =3D self._get_project_environment_directory_path(p=
roject_dir, environment_list)
+        pathlib.Path(project_env_dir).mkdir(parents=3DTrue, exist_ok=3DTru=
e)
+        for testmodule in self._get_testmodule_list(testmodule_testsuite_d=
ict):
+            testsuite_list =3D testmodule_testsuite_dict[testmodule]
+            module_json_formatted_string =3D self._create_testsuite_json_f=
ormatted_string(testsuite_list, testsuite_testcase_dict, testcase_status_di=
ct)
+            file_name =3D '%s.json' % testmodule
+            file_path =3D os.path.join(project_env_dir, file_name)
+            self._write_testsuite_testcase_json_formatted_string_to_file(f=
ile_path, module_json_formatted_string)
+            testcase_list =3D self._get_testcase_list(testsuite_list, test=
suite_testcase_dict)
+            self._write_test_log_files(project_env_dir, testcase_list, tes=
tcase_logs_dict)
+        self._push_testsuite_testcase_json_file_to_git_repo(git_dir, git_d=
ir, git_branch)
+
+    def _create_manual_test_result_from_empty_git(self, git_dir, git_branc=
h, project, environment_list, manual_test_report_dir):
+        workspace_dir =3D self._create_temporary_workspace_dir()
+        project_dir =3D os.path.join(workspace_dir, project)
+        project_env_dir =3D self._get_project_environment_directory_path(p=
roject_dir, environment_list)
+        pathlib.Path(project_env_dir).mkdir(parents=3DTrue, exist_ok=3DTru=
e)
+        # cp files from manual_test_report_dir to project_env_dir
+        # Not yet implement
+        self._copy_files_from_source_to_destination_dir(manual_test_report=
_dir, project_env_dir)
+        self._push_testsuite_testcase_json_file_to_git_repo(workspace_dir,=
 git_dir, git_branch)
+        self._remove_temporary_workspace_dir(workspace_dir)
+
+    def _create_manual_test_result_from_exiting_git(self, git_dir, git_bra=
nch, project, environment_list, manual_test_report_dir):
+        project_dir =3D os.path.join(git_dir, project)
+        project_env_dir =3D self._get_project_environment_directory_path(p=
roject_dir, environment_list)
+        if not self._check_if_git_dir_contain_project_and_environment_dire=
ctory(git_dir, project, environment_list):
+            pathlib.Path(project_env_dir).mkdir(parents=3DTrue, exist_ok=
=3DTrue)
+        # cp files from manual_test_report_dir to existing project_env_dir
+        # Not yet implement
+        self._copy_files_from_source_to_destination_dir(manual_test_report=
_dir, project_env_dir)
+        self._push_testsuite_testcase_json_file_to_git_repo(git_dir, git_d=
ir, git_branch)
+
+    def _load_test_module_file_with_json_into_dictionary(self, file):
+        if os.path.exists(file):
+            with open(file, "r") as f:
+                return json.load(f)
+        else:
+            print('Cannot find file (%s)' % file)
+            return None
+
+    def _get_testcase_log_need_removal_list(self, testcase, cur_testcase_s=
tatus, next_testcase_status, testcase_log_remove_list):
+        if cur_testcase_status =3D=3D 'FAILED' or cur_testcase_status =3D=
=3D 'ERROR':
+            if next_testcase_status =3D=3D 'PASSED' or next_testcase_statu=
s =3D=3D 'SKIPPED':
+                testcase_log_remove_list.append(testcase)
+
+    def _update_target_testresult_dictionary_with_status(self, target_test=
result_dict, testsuite_list, testsuite_testcase_dict, testcase_status_dict,=
 testcase_log_remove_list):
+        for testsuite in testsuite_list:
+            testcase_list =3D testsuite_testcase_dict[testsuite]
+            for testcase in testcase_list:
+                if testcase in testcase_status_dict:
+                    cur_testcase_status =3D target_testresult_dict['testsu=
ite'][testsuite]['testcase'][testcase]['testresult']
+                    next_testcase_status =3D testcase_status_dict[testcase=
]
+                    self._get_testcase_log_need_removal_list(testcase, cur=
_testcase_status, next_testcase_status, testcase_log_remove_list)
+                    target_testresult_dict['testsuite'][testsuite]['testca=
se'][testcase]['testresult'] =3D next_testcase_status
+
+    def _remove_test_log_files(self, file_dir, testcase_log_remove_list):
+        for testcase_log_remove in testcase_log_remove_list:
+            file_remove_path =3D os.path.join(file_dir, '%s.log' % testcas=
e_log_remove)
+            if os.path.exists(file_remove_path):
+                os.remove(file_remove_path)
+
+    def _check_if_git_dir_contain_project_and_environment_directory(self, =
git_dir, project, environment_list):
+        project_dir =3D os.path.join(git_dir, project)
+        project_env_dir =3D self._get_project_environment_directory_path(p=
roject_dir, environment_list)
+        completed_process =3D subprocess.run(["ls", project_env_dir])
+        if completed_process.returncode =3D=3D 0:
+            return True
+        else:
+            return False
+
+    def _git_check_if_git_dir_and_git_branch_exist(self, git_dir, git_bran=
ch):
+        completed_process =3D subprocess.run(["ls", '%s/.git' % git_dir])
+        if not completed_process.returncode =3D=3D 0:
+            return False
+        repo =3D self._git_init(git_dir)
+        try:
+            repo.run_cmd('checkout %s' % git_branch)
+            return True
+        except GitError:
+            return False
+
+    def _git_init(self, git_dir):
+        try:
+            repo =3D GitRepo(git_dir, is_topdir=3DTrue)
+        except GitError:
+            print("Non-empty directory that is not a Git repository "
+                   "at {}\nPlease specify an existing Git repository, "
+                   "an empty directory or a non-existing directory "
+                   "path.".format(git_dir))
+        return repo
+
+    def _git_checkout_git_repo(self, repo, git_branch):
+        repo.run_cmd('checkout %s' % git_branch)
+
+    def _git_checkout_git_repo(self, repo, git_branch):
+        repo.run_cmd('checkout %s' % git_branch)
+
+    def _git_check_if_local_repo_contain_remote_origin(self, repo):
+        try:
+            repo.run_cmd('remote get-url origin')
+            return True
+        except GitError:
+            return False
+
+    def _git_check_if_local_repo_remote_origin_url_match(self, repo, git_r=
emote):
+        try:
+            origin_url =3D repo.run_cmd('remote get-url origin')
+            if origin_url =3D=3D git_remote:
+                return True
+            else:
+                return False
+        except GitError:
+            return False
+
+    def _git_fetch_remote_origin(self, repo):
+        print('Fetching remote origin to local repo')
+        try:
+            repo.run_cmd('fetch origin')
+            return True
+        except GitError:
+            return False
+
+    def _git_check_if_remote_origin_has_branch(self, repo, git_branch):
+        try:
+            output =3D repo.run_cmd('show-branch remotes/origin/%s' % git_=
branch)
+            print(output)
+            return True
+        except GitError:
+            return False
+
+    def _git_add_local_repo_remote_origin(self, repo, git_remote):
+        print('Adding remote origin to local repo')
+        try:
+            repo.run_cmd('remote add origin %s' % git_remote)
+        except GitError:
+            print("The remote add origin failed inside the Git repository"=
)
+
+    def _git_remove_local_repo_remote_origin(self, repo):
+        print('Removing outdated remote origin from local repo')
+        try:
+            repo.run_cmd('remote remove origin')
+        except GitError:
+            print("The remote remove origin failed inside the Git reposito=
ry")
+
+    def _git_fetch_remote_origin_branch(self, repo, git_branch):
+        print('Fetch remote origin %s' % git_branch)
+        try:
+            repo.run_cmd('fetch origin %s' % git_branch)
+        except GitError:
+            print("The fetch origin % failed inside the Git repository" % =
git_branch)
+
+    def _git_rebase_remote_origin(self, repo, git_branch):
+        print('Rebasing origin/%s' % git_branch)
+        try:
+            repo.run_cmd('rebase origin/%s' % git_branch)
+        except GitError:
+            print("The rebase origin/% failed inside the Git repository" %=
 git_branch)
+
+    def _git_push_local_branch_to_remote_origin(self, repo, git_branch):
+        print('Pushing origin %s' % git_branch)
+        try:
+            repo.run_cmd('push origin %s' % git_branch)
+        except GitError:
+            print("The push origin % failed inside the Git repository" % g=
it_branch)
+
+    def _push_testsuite_testcase_json_file_to_git_repo(self, file_dir, git=
_repo, git_branch):
+        return subprocess.run(["oe-git-archive", file_dir, "-g", git_repo,=
 "-b", git_branch])
+
+    def create_automated_test_result(self, git_dir, git_branch, project, e=
nvironment_list, testmodule_testsuite_dict, testsuite_testcase_dict, force_=
create):
+        print('Creating test result for environment list: %s' % environmen=
t_list)
+        if self._git_check_if_git_dir_and_git_branch_exist(git_dir, git_br=
anch):
+            repo =3D self._git_init(git_dir)
+            self._git_checkout_git_repo(repo, git_branch)
+            print('Found git_dir and git_branch: %s %s' % (git_dir, git_br=
anch))
+            print('Entering git_dir: %s' % git_dir)
+            if self._check_if_git_dir_contain_project_and_environment_dire=
ctory(git_dir, project, environment_list):
+                print('Found project and environment inside git_dir: %s' %=
 git_dir)
+                print('Since project and environment already exist, could =
not proceed to create.')
+                if force_create:
+                    print('Force create activated: proceed to create.')
+                    self._create_automated_test_result_from_existing_git(g=
it_dir, git_branch, project, environment_list, testmodule_testsuite_dict, t=
estsuite_testcase_dict, {}, {})
+            else:
+                print('Could not find project and environment inside git_d=
ir: %s' % git_dir)
+                print('Creating project and environment inside git_dir: %s=
' % git_dir)
+                self._create_automated_test_result_from_existing_git(git_d=
ir, git_branch, project, environment_list, testmodule_testsuite_dict, tests=
uite_testcase_dict, {}, {})
+        else:
+            print('Could not find git_dir or git_branch: %s %s' % (git_dir=
, git_branch))
+            print('Creating git_dir, git_branch, project, and environment:=
 %s' % git_dir)
+            self._create_automated_test_result_from_empty_git(git_dir, git=
_branch, project, environment_list, testmodule_testsuite_dict, testsuite_te=
stcase_dict, {}, {})
+
+    def update_automated_test_result(self, git_dir, git_branch, project, e=
nvironment_list, testmodule_testsuite_dict, testsuite_testcase_dict, testca=
se_status_dict, testcase_logs_dict):
+        print('Updating test result for environment list: %s' % environmen=
t_list)
+        repo =3D self._git_init(git_dir)
+        self._git_checkout_git_repo(repo, git_branch)
+        project_dir =3D os.path.join(git_dir, project)
+        project_env_dir =3D self._get_project_environment_directory_path(p=
roject_dir, environment_list)
+        testcase_log_remove_list =3D []
+        for testmodule in self._get_testmodule_list(testmodule_testsuite_d=
ict):
+            testmodule_file =3D os.path.join(project_env_dir, '%s.json' % =
testmodule)
+            target_testresult_dict =3D self._load_test_module_file_with_js=
on_into_dictionary(testmodule_file)
+            testsuite_list =3D testmodule_testsuite_dict[testmodule]
+            self._update_target_testresult_dictionary_with_status(target_t=
estresult_dict, testsuite_list, testsuite_testcase_dict, testcase_status_di=
ct, testcase_log_remove_list)
+            self._write_testsuite_testcase_json_formatted_string_to_file(t=
estmodule_file, json.dumps(target_testresult_dict, sort_keys=3DTrue, indent=
=3D4))
+            testcase_list =3D self._get_testcase_list(testsuite_list, test=
suite_testcase_dict)
+            self._write_test_log_files(project_env_dir, testcase_list, tes=
tcase_logs_dict)
+        self._remove_test_log_files(project_env_dir, testcase_log_remove_l=
ist)
+        self._push_testsuite_testcase_json_file_to_git_repo(git_dir, git_d=
ir, git_branch)
+
+    def smart_update_automated_test_result(self, git_dir, git_branch, proj=
ect, environment_list, testmodule_testsuite_dict, testsuite_testcase_dict, =
testcase_status_dict, testcase_logs_dict):
+        print('Creating/Updating test result for environment list: %s' % e=
nvironment_list)
+        if self._git_check_if_git_dir_and_git_branch_exist(git_dir, git_br=
anch):
+            repo =3D self._git_init(git_dir)
+            self._git_checkout_git_repo(repo, git_branch)
+            print('Found git_dir and git_branch: %s %s' % (git_dir, git_br=
anch))
+            print('Entering git_dir: %s' % git_dir)
+            if self._check_if_git_dir_contain_project_and_environment_dire=
ctory(git_dir, project, environment_list):
+                print('Found project and environment inside git_dir: %s' %=
 git_dir)
+                print('Updating test result')
+                self.update_automated_test_result(git_dir, git_branch, pro=
ject, environment_list, testmodule_testsuite_dict, testsuite_testcase_dict,=
 testcase_status_dict, testcase_logs_dict)
+            else:
+                print('Could not find project and environment inside git_d=
ir: %s' % git_dir)
+                print('Creating project and environment inside git_dir: %s=
' % git_dir)
+                self._create_automated_test_result_from_existing_git(git_d=
ir, git_branch, project, environment_list, testmodule_testsuite_dict, tests=
uite_testcase_dict, testcase_status_dict, testcase_logs_dict)
+        else:
+            print('Could not find git_dir or git_branch: %s %s' % (git_dir=
, git_branch))
+            print('Creating git_dir, git_branch, project, and environment:=
 %s' % git_dir)
+            self._create_automated_test_result_from_empty_git(git_dir, git=
_branch, project, environment_list, testmodule_testsuite_dict, testsuite_te=
stcase_dict, testcase_status_dict, testcase_logs_dict)
+
+    def create_manual_test_result(self, git_dir, git_branch, project, envi=
ronment_list, manual_test_report_dir):
+        print('Creating test result for environment list: %s' % environmen=
t_list)
+        if self._git_check_if_git_dir_and_git_branch_exist(git_dir, git_br=
anch):
+            repo =3D self._git_init(git_dir)
+            self._git_checkout_git_repo(repo, git_branch)
+            print('Found git_dir and git_branch: %s %s' % (git_dir, git_br=
anch))
+            print('Entering git_dir: %s' % git_dir)
+            if self._check_if_git_dir_contain_project_and_environment_dire=
ctory(git_dir, project, environment_list):
+                print('Found project and environment inside git_dir: %s' %=
 git_dir)
+                print('Since project and environment already exist, could =
not proceed to create.')
+            else:
+                print('Could not find project and environment inside git_d=
ir: %s' % git_dir)
+                print('Creating project and environment inside git_dir: %s=
' % git_dir)
+                self._create_manual_test_result_from_exiting_git(git_dir, =
git_branch, project, environment_list, manual_test_report_dir)
+        else:
+            print('Could not find git_dir or git_branch: %s %s' % (git_dir=
, git_branch))
+            print('Creating git_dir, git_branch, project, and environment:=
 %s' % git_dir)
+            self._create_manual_test_result_from_empty_git(git_dir, git_br=
anch, project, environment_list, manual_test_report_dir)
+
+    def git_remote_fetch_rebase_push(self, git_dir, git_branch, git_remote=
):
+        print('Pushing test result to remote git ...')
+        repo =3D self._git_init(git_dir)
+        print('Fetching, Rebasing, Pushing to remote')
+        if self._git_check_if_local_repo_contain_remote_origin(repo):
+            if not self._git_check_if_local_repo_remote_origin_url_match(r=
epo, git_remote):
+                self._git_remove_local_repo_remote_origin(repo)
+                self._git_add_local_repo_remote_origin(repo, git_remote)
+        else:
+            self._git_add_local_repo_remote_origin(repo, git_remote)
+        if self._git_fetch_remote_origin(repo):
+            if self._git_check_if_remote_origin_has_branch(repo, git_branc=
h):
+                self._git_fetch_remote_origin_branch(repo, git_branch)
+                self._git_rebase_remote_origin(repo, git_branch)
+            self._git_push_local_branch_to_remote_origin(repo, git_branch)
+        else:
+            print('Git fetch origin failed. Stop proceeding to git push.')
+
+    def checkout_git_branch(self, git_dir, git_branch):
+        print('Checkout git branch ...')
+        if self._git_check_if_git_dir_and_git_branch_exist(git_dir, git_br=
anch):
+            repo =3D self._git_init(git_dir)
+            self._git_checkout_git_repo(repo, git_branch)
+            return True
+        else:
+            print('Could not find git_dir or git_branch: %s %s' % (git_dir=
, git_branch))
+            return False
diff --git a/scripts/lib/testresultlog/oeqalogparser.py b/scripts/lib/testr=
esultlog/oeqalogparser.py
new file mode 100644
index 0000000..0afba18
--- /dev/null
+++ b/scripts/lib/testresultlog/oeqalogparser.py
@@ -0,0 +1,97 @@
+import re
+
+class OeqaLogParser(object):
+
+    def get_test_status(self, log_file):
+        regex =3D ".*RESULTS - (?P<case_name>.*) - Testcase .*: (?P<status=
>PASSED|FAILED|SKIPPED|ERROR|UNKNOWN).*$"
+        regex_comp =3D re.compile(regex)
+        results =3D {}
+        with open(log_file, "r") as f:
+            for line in f:
+                line =3D line.strip()
+                m =3D regex_comp.search(line)
+                if m:
+                    results[m.group('case_name')] =3D m.group('status')
+        return results
+
+    def get_failed_tests(self, log_file):
+        regex =3D ".*RESULTS - (?P<case_name>.*) - Testcase (?P<case_id>\d=
+): (?P<status>FAILED)$"
+        regex_comp =3D re.compile(regex)
+        results =3D {}
+        with open(log_file, "r") as f:
+            for line in f:
+                line =3D line.strip()
+                m =3D regex_comp.search(line)
+                if m:
+                    results[m.group('case_name')] =3D m.group('status')
+        return results
+
+    def get_runtime_test_image_environment(self, log_file):
+        regex =3D "core-image.*().*Ran.*tests in .*s"
+        regex_comp =3D re.compile(regex)
+        image_env =3D ''
+        with open(log_file, "r") as f:
+            for line in f:
+                line =3D line.strip()
+                m =3D regex_comp.search(line)
+                if m:
+                    image_env =3D line[:line.find("(")-1]
+                    image_env =3D image_env.strip()
+                    break
+        return image_env
+
+    def get_runtime_test_qemu_environment(self, log_file):
+        regex =3D "DEBUG: launchcmd=3Drunqemu*"
+        regex_comp =3D re.compile(regex)
+        qemu_env =3D ''
+        with open(log_file, "r") as f:
+            for line in f:
+                line =3D line.strip()
+                m =3D regex_comp.search(line)
+                if m:
+                    qemu_list =3D ['qemuarm', 'qemuarm64', 'qemumips', 'qe=
mumips64', 'qemuppc', 'qemux86', 'qemux86-64']
+                    for qemu in qemu_list:
+                        if qemu in line:
+                            qemu_env =3D qemu
+                            break
+        return qemu_env
+
+    def _search_log_to_capture(self, logs, line, state, regex_comp_start, =
regex_comp_end_fail_or, regex_comp_end_error_or, regex_comp_end):
+        if state =3D=3D 'Searching':
+            m =3D regex_comp_start.search(line)
+            if m:
+                logs.append(line)
+                return 'Found'
+            else:
+                return 'Searching'
+        elif state =3D=3D 'Found':
+            m_fail =3D regex_comp_end_fail_or.search(line)
+            m_error =3D regex_comp_end_error_or.search(line)
+            m_end =3D regex_comp_end.search(line)
+            if m_fail or m_error or m_end:
+                return 'End'
+            else:
+                logs.append(line)
+                return 'Found'
+
+    def get_test_log(self, log_file, test_status, testcase_name, testsuite=
_name):
+        if test_status =3D=3D 'FAILED':
+            test_status =3D 'FAIL'
+        regex_search_start =3D ".*%s: %s \(%s\).*" % (test_status, testcas=
e_name, testsuite_name)
+        regex_search_end_fail_or =3D ".*FAIL: test.*"
+        regex_search_end_error_or =3D ".*ERROR: test.*"
+        regex_search_end =3D ".*Ran.*tests in .*s"
+        regex_comp_start =3D re.compile(regex_search_start)
+        regex_comp_end_fail_or =3D re.compile(regex_search_end_fail_or)
+        regex_comp_end_error_or =3D re.compile(regex_search_end_error_or)
+        regex_comp_end =3D re.compile(regex_search_end)
+        state =3D 'Searching'
+        logs =3D []
+        with open(log_file, "r") as f:
+            for line in f:
+                line =3D line.strip()
+                if state =3D=3D 'End':
+                    return logs
+                else:
+                    state =3D self._search_log_to_capture(logs, line, stat=
e, regex_comp_start, regex_comp_end_fail_or, regex_comp_end_error_or, regex=
_comp_end)
+
diff --git a/scripts/lib/testresultlog/oeqatestdiscover.py b/scripts/lib/te=
stresultlog/oeqatestdiscover.py
new file mode 100644
index 0000000..b1b6cca
--- /dev/null
+++ b/scripts/lib/testresultlog/oeqatestdiscover.py
@@ -0,0 +1,65 @@
+import unittest
+
+class OeqaTestDiscover(object):
+
+    def _discover_unittest_testsuite_testcase(self, test_dir):
+        loader =3D unittest.TestLoader()
+        testsuite_testcase =3D loader.discover(start_dir=3Dtest_dir, patte=
rn=3D'*.py')
+        return testsuite_testcase
+
+    def _generate_flat_list_of_unittest_testcase(self, testsuite):
+        for test in testsuite:
+            if unittest.suite._isnotsuite(test):
+                yield test
+            else:
+                for subtest in self._generate_flat_list_of_unittest_testca=
se(test):
+                    yield subtest
+
+    def _get_testsuite_from_unittest_testcase(self, unittest_testcase):
+        testsuite =3D unittest_testcase[unittest_testcase.find("(")+1:unit=
test_testcase.find(")")]
+        return testsuite
+
+    def _get_testcase_from_unittest_testcase(self, unittest_testcase):
+        testcase =3D unittest_testcase[0:unittest_testcase.find("(")-1]
+        testsuite =3D self._get_testsuite_from_unittest_testcase(unittest_=
testcase)
+        testcase =3D '%s.%s' % (testsuite, testcase)
+        return testcase
+
+    def _get_testcase_list(self, unittest_testcase_list):
+        testcase_list =3D []
+        for unittest_testcase in unittest_testcase_list:
+            testcase_list.append(self._get_testcase_from_unittest_testcase=
(str(unittest_testcase)))
+        return testcase_list
+
+    def _get_testcase_remove_pattern_list(self, testcase_remove_source_fil=
e):
+        testcase_remove_pattern_list =3D []
+        with open(testcase_remove_source_file, "r") as f:
+            for line in f:
+                line =3D line.strip()
+                if not line.find('#') =3D=3D 0:
+                    testcase_remove_pattern_list.append(line)
+        return testcase_remove_pattern_list
+
+    def _remove_test_case_from_removal_pattern_list(self, testcase_list, t=
estcase_remove_pattern_list):
+        print('testcase remove pattern list: %s' % testcase_remove_pattern=
_list)
+        testcase_remove_list =3D []
+        for testcase_remove_pattern in testcase_remove_pattern_list:
+            for testcase in testcase_list:
+                #print('Find testcase (%s) for %s' % (testcase, testcase_r=
emove_pattern))
+                if testcase.find(testcase_remove_pattern) =3D=3D 0:
+                    testcase_remove_list.append(testcase)
+        print('testcase remove list: %s' % testcase_remove_list)
+        for testcase_remove in testcase_remove_list:
+            print('testcase_remove: %s' % testcase_remove)
+            if testcase_remove in testcase_list:
+                testcase_list.remove(testcase_remove)
+
+    def get_oeqa_testcase_list(self, testcase_dir, testcase_remove_file):
+        unittest_testsuite_testcase =3D self._discover_unittest_testsuite_=
testcase(testcase_dir)
+        unittest_testcase_list =3D self._generate_flat_list_of_unittest_te=
stcase(unittest_testsuite_testcase)
+        testcase_list =3D self._get_testcase_list(unittest_testcase_list)
+        if len(testcase_remove_file) > 0:
+            testcase_remove_pattern_list =3D self._get_testcase_remove_pat=
tern_list(testcase_remove_file)
+            self._remove_test_case_from_removal_pattern_list(testcase_list=
, testcase_remove_pattern_list)
+        return testcase_list
+
diff --git a/scripts/lib/testresultlog/storeauto.py b/scripts/lib/testresul=
tlog/storeauto.py
new file mode 100644
index 0000000..58622ed
--- /dev/null
+++ b/scripts/lib/testresultlog/storeauto.py
@@ -0,0 +1,122 @@
+from testresultlog.gitstore import GitStore
+from testresultlog.oeqatestdiscover import OeqaTestDiscover
+from testresultlog.oeqalogparser import OeqaLogParser
+
+class StoreAuto(object):
+
+    def _get_testsuite_from_testcase(self, testcase):
+        testsuite =3D testcase[0:testcase.rfind(".")]
+        return testsuite
+
+    def _get_testmodule_from_testsuite(self, testsuite):
+        testmodule =3D testsuite[0:testsuite.find(".")]
+        return testmodule
+
+    def _remove_testsuite_from_testcase(self, testcase, testsuite):
+        testsuite =3D testsuite + '.'
+        testcase_remove_testsuite =3D testcase.replace(testsuite, '')
+        return testcase_remove_testsuite
+
+    def _get_testsuite_from_testcase(self, testcase):
+        testsuite =3D testcase[0:testcase.rfind(".")]
+        return testsuite
+
+    def _get_testmodule_from_testsuite(self, testsuite):
+        testmodule =3D testsuite[0:testsuite.find(".")]
+        return testmodule
+
+    def _add_new_environment_to_environment_list(self, environment_list, n=
ew_environment):
+        if len(new_environment) > 0 and new_environment not in environment=
_list:
+            if len(environment_list) =3D=3D 0:
+                environment_list =3D new_environment
+            else:
+                environment_list =3D '%s,%s' % (environment_list, new_envi=
ronment)
+        return environment_list
+
+    def get_environment_list_for_test_log(self, log_file, log_file_source,=
 environment_list, oeqa_logparser):
+        print('Getting test environment information from test log at %s' %=
 log_file)
+        if log_file_source =3D=3D 'runtime':
+            runtime_image_env =3D oeqa_logparser.get_runtime_test_image_en=
vironment(log_file)
+            print('runtime image environment: %s' % runtime_image_env)
+            runtime_qemu_env =3D oeqa_logparser.get_runtime_test_qemu_envi=
ronment(log_file)
+            print('runtime qemu environment: %s' % runtime_qemu_env)
+            environment_list =3D self._add_new_environment_to_environment_=
list(environment_list, runtime_image_env)
+            environment_list =3D self._add_new_environment_to_environment_=
list(environment_list, runtime_qemu_env)
+        return environment_list.split(",")
+
+    def get_testsuite_testcase_dictionary(self, testcase_dir, testcase_rem=
ove_file):
+        print('Getting testsuite testcase information from oeqa directory =
at %s' % testcase_dir)
+        oeqatestdiscover =3D OeqaTestDiscover()
+        testcase_list =3D oeqatestdiscover.get_oeqa_testcase_list(testcase=
_dir, testcase_remove_file)
+        testsuite_testcase_dict =3D {}
+        for testcase in testcase_list:
+            testsuite =3D self._get_testsuite_from_testcase(testcase)
+            if testsuite in testsuite_testcase_dict:
+                testsuite_testcase_dict[testsuite].append(testcase)
+            else:
+                testsuite_testcase_dict[testsuite] =3D [testcase]
+        return testsuite_testcase_dict
+
+    def get_testmodule_testsuite_dictionary(self, testsuite_testcase_dict)=
:
+        print('Getting testmodule testsuite information')
+        testsuite_list =3D testsuite_testcase_dict.keys()
+        testmodule_testsuite_dict =3D {}
+        for testsuite in testsuite_list:
+            testmodule =3D self._get_testmodule_from_testsuite(testsuite)
+            if testmodule in testmodule_testsuite_dict:
+                testmodule_testsuite_dict[testmodule].append(testsuite)
+            else:
+                testmodule_testsuite_dict[testmodule] =3D [testsuite]
+        return testmodule_testsuite_dict
+
+    def get_testcase_failed_or_error_logs_dictionary(self, log_file, testc=
ase_status_dict):
+        print('Getting testcase failed or error log from %s' % log_file)
+        testresultlogparser =3D OeqaLogParser()
+        testcase_list =3D testcase_status_dict.keys()
+        testcase_failed_or_error_logs_dict =3D {}
+        for testcase in testcase_list:
+            test_status =3D testcase_status_dict[testcase]
+            if test_status =3D=3D 'FAILED' or test_status =3D=3D 'ERROR':
+                testsuite =3D self._get_testsuite_from_testcase(testcase)
+                testfunction =3D self._remove_testsuite_from_testcase(test=
case, testsuite)
+                logs =3D testresultlogparser.get_test_log(log_file, test_s=
tatus, testfunction, testsuite)
+                testcase_failed_or_error_logs_dict[testcase] =3D logs
+        return testcase_failed_or_error_logs_dict
+
+def main(args):
+    oeqa_logparser =3D OeqaLogParser()
+    testcase_status_dict =3D oeqa_logparser.get_test_status(args.log_file)
+
+    store_auto =3D StoreAuto()
+    environment_list =3D store_auto.get_environment_list_for_test_log(args=
.log_file, args.source, args.environment_list, oeqa_logparser)
+    testsuite_testcase_dict =3D store_auto.get_testsuite_testcase_dictiona=
ry(args.case_dir, args.testcase_remove_file)
+    testmodule_testsuite_dict =3D store_auto.get_testmodule_testsuite_dict=
ionary(testsuite_testcase_dict)
+    test_logs_dict =3D store_auto.get_testcase_failed_or_error_logs_dictio=
nary(args.log_file, testcase_status_dict)
+
+    gitstore =3D GitStore()
+    gitstore.smart_update_automated_test_result(args.git_repo, args.git_br=
anch, args.component, environment_list, testmodule_testsuite_dict, testsuit=
e_testcase_dict, testcase_status_dict, test_logs_dict)
+    if (len(args.git_remote) > 0):
+        gitstore.git_remote_fetch_rebase_push(args.git_repo, args.git_bran=
ch, args.git_remote)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build =3D subparsers.add_parser('store-auto', help=3D'Store OEQ=
A automated test status & log into git repository',
+                                         description=3D'Store OEQA automat=
ed test status & log into git repository',
+                                         group=3D'store')
+    parser_build.set_defaults(func=3Dmain)
+    parser_build.add_argument('component', help=3D'Component folder (as th=
e top folder) to store the test status & log')
+    parser_build.add_argument('git_branch', help=3D'Git branch to store th=
e test status & log')
+    parser_build.add_argument('log_file', help=3D'Full path to the OEQA au=
tomated test log file to be used for test result storing')
+    SOURCE =3D ('runtime', 'selftest', 'sdk', 'sdkext')
+    parser_build.add_argument('source', choices=3DSOURCE,
+    help=3D'Selected testcase sources to be used for OEQA testcase discove=
ry and testcases discovered will be used as the base testcases for storing =
test status & log. '
+         '"runtime" will search testcase available in meta/lib/oeqa/runtim=
e/cases. '
+         '"selftest" will search testcase available in meta/lib/oeqa/selft=
est/cases. '
+         '"sdk" will search testcase available in meta/lib/oeqa/sdk/cases.=
 '
+         '"sdkext" will search testcase available in meta/lib/oeqa/sdkext/=
cases. ')
+    parser_build.add_argument('-g', '--git_repo', default=3D'default', hel=
p=3D'(Optional) Full path to the git repository used for storage, default w=
ill be <top_dir>/test-result-log.git')
+    parser_build.add_argument('-e', '--environment_list', default=3D'defau=
lt', help=3D'(Optional) List of environment seperated by comma (",") used t=
o label the test environments for the stored test status & log')
+    parser_build.add_argument('-r', '--git_remote', default=3D'default', h=
elp=3D'(Optional) Git remote repository used for storage')
+    parser_build.add_argument('-o', '--oe_dir', default=3D'default', help=
=3D'(Optional) OE top directory to be used for OEQA testcase discovery, def=
ault will use current <top_dir> directory')
+    parser_build.add_argument('-m', '--testcase_remove_file', default=3D'd=
efault', help=3D'(Optional) Full path to the file (created during test plan=
ning) used to define list of testcases to be excluded from storage')
diff --git a/scripts/lib/testresultlog/template/test_report_full_text.txt b=
/scripts/lib/testresultlog/template/test_report_full_text.txt
new file mode 100644
index 0000000..78c49ea
--- /dev/null
+++ b/scripts/lib/testresultlog/template/test_report_full_text.txt
@@ -0,0 +1,33 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Test Report (Count of passed, failed, skipped group by test_component, tes=
t_environment)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--------------------------------------------------------------------------=
------------------------------------
+{{ 'test_component'.ljust(max_len_component) }} | {{ 'test_environment'.lj=
ust(max_len_environment) }} | {{ 'passed'.ljust(10) }} | {{ 'failed'.ljust(=
10) }} | {{ 'skipped'.ljust(10) }}
+--------------------------------------------------------------------------=
------------------------------------
+{% for report in test_reports |sort(attribute=3D'test_component_environmen=
t') %}
+{{ report.test_component.ljust(max_len_component) }} | {{ report.test_envi=
ronment.ljust(max_len_environment) }} | {{ report.passed.ljust(10) }} | {{ =
report.failed.ljust(10) }} | {{ report.skipped.ljust(10) }}
+{% endfor %}
+--------------------------------------------------------------------------=
------------------------------------
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Test Report (Percent of passed, failed, skipped group by test_component, t=
est_environment)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--------------------------------------------------------------------------=
------------------------------------
+{{ 'test_component'.ljust(max_len_component) }} | {{ 'test_environment'.lj=
ust(max_len_environment) }} | {{ 'passed_%'.ljust(10) }} | {{ 'failed_%'.lj=
ust(10) }} | {{ 'skipped_%'.ljust(10) }}
+--------------------------------------------------------------------------=
------------------------------------
+{% for report in test_reports |sort(attribute=3D'test_component_environmen=
t') %}
+{{ report.test_component.ljust(max_len_component) }} | {{ report.test_envi=
ronment.ljust(max_len_environment) }} | {{ report.passed_percent.ljust(10) =
}} | {{ report.failed_percent.ljust(10) }} | {{ report.skipped_percent.ljus=
t(10) }}
+{% endfor %}
+--------------------------------------------------------------------------=
------------------------------------
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Test Report (Failed test cases group by test_component, test_environment)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--------------------------------------------------------------------------=
------------------------------------
+{% for report in test_reports |sort(attribute=3D'test_component_environmen=
t') %}
+test_component | test_environment : {{ report.test_component }} | {{ repor=
t.test_environment }}
+{% for testcase in report.failed_testcases %}
+    {{ testcase }}
+{% endfor %}
+{% endfor %}
+--------------------------------------------------------------------------=
------------------------------------
\ No newline at end of file
diff --git a/scripts/lib/testresultlog/template/test_report_include_idle_fu=
ll_text.txt b/scripts/lib/testresultlog/template/test_report_include_idle_f=
ull_text.txt
new file mode 100644
index 0000000..0328973
--- /dev/null
+++ b/scripts/lib/testresultlog/template/test_report_include_idle_full_text=
.txt
@@ -0,0 +1,33 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Test Report (Count of complete (passed, failed, skipped) vs idle group by =
test_component, test_environment)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--------------------------------------------------------------------------=
------------------------------------
+{{ 'test_component'.ljust(max_len_component) }} | {{ 'test_environment'.lj=
ust(max_len_environment) }} | {{ 'complete'.ljust(10) }} | {{ 'passed'.ljus=
t(10) }} | {{ 'failed'.ljust(10) }} | {{ 'skipped'.ljust(10) }} | {{ 'idle'=
.ljust(10) }}
+--------------------------------------------------------------------------=
------------------------------------
+{% for report in test_reports |sort(attribute=3D'test_component_environmen=
t') %}
+{{ report.test_component.ljust(max_len_component) }} | {{ report.test_envi=
ronment.ljust(max_len_environment) }} | {{ report.complete.ljust(10) }} | {=
{ report.passed.ljust(10) }} | {{ report.failed.ljust(10) }} | {{ report.sk=
ipped.ljust(10) }} | {{ report.idle.ljust(10) }}
+{% endfor %}
+--------------------------------------------------------------------------=
------------------------------------
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Test Report (Percent of complete (passed, failed, skipped) vs idle group b=
y test_component, test_environment)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--------------------------------------------------------------------------=
------------------------------------
+{{ 'test_component'.ljust(max_len_component) }} | {{ 'test_environment'.lj=
ust(max_len_environment) }} | {{ 'complete_%'.ljust(10) }} | {{ 'passed_%'.=
ljust(10) }} | {{ 'failed_%'.ljust(10) }} | {{ 'skipped_%'.ljust(10) }} | {=
{ 'idle_%'.ljust(10) }}
+--------------------------------------------------------------------------=
------------------------------------
+{% for report in test_reports |sort(attribute=3D'test_component_environmen=
t') %}
+{{ report.test_component.ljust(max_len_component) }} | {{ report.test_envi=
ronment.ljust(max_len_environment) }} | {{ report.complete_percent.ljust(10=
) }} | {{ report.passed_percent.ljust(10) }} | {{ report.failed_percent.lju=
st(10) }} | {{ report.skipped_percent.ljust(10) }} | {{ report.idle_percent=
.ljust(10) }}
+{% endfor %}
+--------------------------------------------------------------------------=
------------------------------------
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Test Report (Failed test cases group by test_component, test_environment)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--------------------------------------------------------------------------=
------------------------------------
+{% for report in test_reports |sort(attribute=3D'test_component_environmen=
t') %}
+test_component | test_environment : {{ report.test_component }} | {{ repor=
t.test_environment }}
+{% for testcase in report.failed_testcases %}
+    {{ testcase }}
+{% endfor %}
+{% endfor %}
+--------------------------------------------------------------------------=
------------------------------------
\ No newline at end of file
diff --git a/scripts/lib/testresultlog/view.py b/scripts/lib/testresultlog/=
view.py
new file mode 100644
index 0000000..9edd3ec
--- /dev/null
+++ b/scripts/lib/testresultlog/view.py
@@ -0,0 +1,198 @@
+import glob
+import os
+import json
+from jinja2 import Environment, FileSystemLoader
+from testresultlog.gitstore import GitStore
+
+class TestResultView(object):
+
+    def _check_if_existing_dir_list_contain_parent_for_new_dir(self, dir_l=
ist, new_dir):
+        for existing_dir in dir_list:
+            if existing_dir in new_dir:
+                return True
+        return False
+
+    def _replace_existing_parent_dir_with_new_dir(self, dir_list, new_dir)=
:
+        return [new_dir if dir in new_dir else dir for dir in dir_list]
+
+    def _get_test_report_directory_list(self, git_dir):
+        exclude =3D ['.git']
+        report_dir_list =3D []
+        for root, dirs, files in os.walk(git_dir, topdown=3DTrue):
+            for dir in dirs:
+                [dirs.remove(d) for d in list(dirs) if d in exclude]
+
+            for dir in dirs:
+                dirname =3D os.path.join(root, dir)
+                if self._check_if_existing_dir_list_contain_parent_for_new=
_dir(report_dir_list, dirname):
+                    report_dir_list =3D self._replace_existing_parent_dir_=
with_new_dir(report_dir_list, dirname)
+                else:
+                    report_dir_list.append(dirname)
+        return report_dir_list
+
+    def _get_list_of_test_result_files(self, report_dir):
+        path_pattern =3D os.path.join(report_dir, '*.json')
+        return glob.glob(path_pattern)
+
+    def _load_test_module_file_with_json_into_dictionary(self, file):
+        with open(file, "r") as f:
+            return json.load(f)
+
+    def _get_test_result_and_failed_error_testcase(self, test_result_dict,=
 show_idle):
+        count_idle =3D 0
+        count_passed =3D 0
+        count_failed =3D 0
+        count_skipped =3D 0
+        test_suites_dict =3D test_result_dict['testsuite']
+        test_suites_list =3D test_suites_dict.keys()
+        for suite in test_suites_list:
+            test_cases_dict =3D test_suites_dict[suite]['testcase']
+            test_cases_list =3D test_cases_dict.keys()
+            failed_error_test_case_list =3D []
+            for test_case in test_cases_list:
+                test_status =3D test_cases_dict[test_case]['testresult']
+                if test_status =3D=3D 'FAILED' or test_status =3D=3D 'ERRO=
R':
+                    failed_error_test_case_list.append(test_case)
+                    count_failed +=3D 1
+                elif test_status =3D=3D 'PASSED':
+                    count_passed +=3D 1
+                elif test_status =3D=3D 'SKIPPED':
+                    count_skipped +=3D 1
+                elif test_status =3D=3D "":
+                    count_idle +=3D 1
+        if show_idle:
+            return count_idle, count_passed, count_failed, count_skipped, =
failed_error_test_case_list
+        else:
+            return count_passed, count_failed, count_skipped, failed_error=
_test_case_list
+
+    def _compute_test_result_percent_indicator(self, test_result):
+        total_tested =3D test_result['passed'] + test_result['failed'] + t=
est_result['skipped']
+        test_result['passed_percent'] =3D 0
+        test_result['failed_percent'] =3D 0
+        test_result['skipped_percent'] =3D 0
+        if total_tested > 0:
+            test_result['passed_percent'] =3D format(test_result['passed']=
/total_tested * 100, '.2f')
+            test_result['failed_percent'] =3D format(test_result['failed']=
/total_tested * 100, '.2f')
+            test_result['skipped_percent'] =3D format(test_result['skipped=
']/total_tested * 100, '.2f')
+
+    def _compute_test_result_include_idle_percent_indicator(self, test_res=
ult):
+        total_tested =3D test_result['idle'] + test_result['passed'] + tes=
t_result['failed'] + test_result['skipped']
+        test_result['complete_percent'] =3D 0
+        test_result['idle_percent'] =3D 0
+        test_result['passed_percent'] =3D 0
+        test_result['failed_percent'] =3D 0
+        test_result['skipped_percent'] =3D 0
+        if total_tested > 0:
+            test_result['complete_percent'] =3D format(test_result['comple=
te']/total_tested * 100, '.2f')
+            test_result['idle_percent'] =3D format(test_result['idle']/tot=
al_tested * 100, '.2f')
+            test_result['passed_percent'] =3D format(test_result['passed']=
/total_tested * 100, '.2f')
+            test_result['failed_percent'] =3D format(test_result['failed']=
/total_tested * 100, '.2f')
+            test_result['skipped_percent'] =3D format(test_result['skipped=
']/total_tested * 100, '.2f')
+
+    def _convert_test_result_value_to_string(self, test_result):
+        test_result['passed_percent'] =3D str(test_result['passed_percent'=
])
+        test_result['failed_percent'] =3D str(test_result['failed_percent'=
])
+        test_result['skipped_percent'] =3D str(test_result['skipped_percen=
t'])
+        test_result['passed'] =3D str(test_result['passed'])
+        test_result['failed'] =3D str(test_result['failed'])
+        test_result['skipped'] =3D str(test_result['skipped'])
+        if 'idle' in test_result:
+            test_result['idle'] =3D str(test_result['idle'])
+        if 'idle_percent' in test_result:
+            test_result['idle_percent'] =3D str(test_result['idle_percent'=
])
+        if 'complete' in test_result:
+            test_result['complete'] =3D str(test_result['complete'])
+        if 'complete_percent' in test_result:
+            test_result['complete_percent'] =3D str(test_result['complete_=
percent'])
+
+    def _get_max_string_len_from_test_result_list(self, test_result_list, =
key, default_max_len):
+        max_len =3D default_max_len
+        for test_result in test_result_list:
+            value_len =3D len(test_result[key])
+            if value_len > max_len:
+                max_len =3D value_len
+        return max_len
+
+    def _compile_test_result_for_test_report_directory(self, report_dir):
+        test_result_files =3D self._get_list_of_test_result_files(report_d=
ir)
+        test_result =3D {'passed':0, 'failed':0, 'skipped':0, 'failed_test=
cases':[]}
+        for file in test_result_files:
+            test_result_dict =3D self._load_test_module_file_with_json_int=
o_dictionary(file)
+            count_passed, count_failed, count_skipped, failed_error_test_c=
ase_list =3D self._get_test_result_and_failed_error_testcase(test_result_di=
ct, False)
+            test_result['passed'] +=3D count_passed
+            test_result['failed'] +=3D count_failed
+            test_result['skipped'] +=3D count_skipped
+            test_result['failed_testcases'] +=3D failed_error_test_case_li=
st
+        self._compute_test_result_percent_indicator(test_result)
+        self._convert_test_result_value_to_string(test_result)
+        return test_result
+
+    def _compile_test_result_include_idle_for_test_report_directory(self, =
report_dir):
+        test_result_files =3D self._get_list_of_test_result_files(report_d=
ir)
+        test_result =3D {'complete':0, 'idle':0, 'passed':0, 'failed':0, '=
skipped':0, 'failed_testcases':[]}
+        for file in test_result_files:
+            test_result_dict =3D self._load_test_module_file_with_json_int=
o_dictionary(file)
+            count_idle, count_passed, count_failed, count_skipped, failed_=
error_test_case_list =3D self._get_test_result_and_failed_error_testcase(te=
st_result_dict, True)
+            count_complete =3D count_passed + count_failed + count_skipped
+            test_result['complete'] +=3D count_complete
+            test_result['idle'] +=3D count_idle
+            test_result['passed'] +=3D count_passed
+            test_result['failed'] +=3D count_failed
+            test_result['skipped'] +=3D count_skipped
+            test_result['failed_testcases'] +=3D failed_error_test_case_li=
st
+        self._compute_test_result_include_idle_percent_indicator(test_resu=
lt)
+        self._convert_test_result_value_to_string(test_result)
+        return test_result
+
+    def _get_test_component_environment_from_test_report_dir(self, git_rep=
o, report_dir):
+        test_component_environment =3D report_dir.replace(git_repo + '/', =
'')
+        test_component =3D test_component_environment[:test_component_envi=
ronment.find("/")]
+        test_environment =3D test_component_environment.replace(test_compo=
nent + '/', '')
+        return test_component, test_environment, test_component_environmen=
t
+
+    def _rendering_text_based_test_report(self, template_file_name, test_r=
esult_list, max_len_component, max_len_environment):
+        script_path =3D os.path.dirname(os.path.realpath(__file__))
+        file_loader =3D FileSystemLoader(script_path + '/template')
+        env =3D Environment(loader=3Dfile_loader, trim_blocks=3DTrue)
+        #template =3D env.get_template('test_report_full_text.txt')
+        template =3D env.get_template(template_file_name)
+        output =3D template.render(test_reports=3Dtest_result_list, max_le=
n_component=3Dmax_len_component, max_len_environment=3Dmax_len_environment)
+        print('Printing text-based test report:')
+        print(output)
+
+    def create_text_based_test_report(self, git_repo, show_completion):
+        report_dir_list =3D self._get_test_report_directory_list(git_repo)
+        test_result_list =3D []
+        for report_dir in report_dir_list:
+            print('Compiling test result for %s:' % report_dir)
+            if show_completion:
+                template_file_name =3D 'test_report_include_idle_full_text=
.txt'
+                test_result =3D self._compile_test_result_include_idle_for=
_test_report_directory(report_dir)
+            else:
+                template_file_name =3D 'test_report_full_text.txt'
+                test_result =3D self._compile_test_result_for_test_report_=
directory(report_dir)
+            test_component, test_environment, test_component_environment =
=3D self._get_test_component_environment_from_test_report_dir(git_repo, rep=
ort_dir)
+            test_result['test_component'] =3D test_component
+            test_result['test_environment'] =3D test_environment
+            test_result['test_component_environment'] =3D test_component_e=
nvironment
+            test_result_list.append(test_result)
+        max_len_component =3D self._get_max_string_len_from_test_result_li=
st(test_result_list, 'test_component', len('test_component'))
+        max_len_environment =3D self._get_max_string_len_from_test_result_=
list(test_result_list, 'test_environment', len('test_environment'))
+        self._rendering_text_based_test_report(template_file_name, test_re=
sult_list, max_len_component, max_len_environment)
+
+def main(args):
+    gitstore =3D GitStore()
+    if gitstore.checkout_git_branch(args.git_repo, args.git_branch):
+        testresultview =3D TestResultView()
+        testresultview.create_text_based_test_report(args.git_repo, args.s=
how_completion)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build =3D subparsers.add_parser('view', help=3D'View text-based=
 summary test report',
+                                         description=3D'View text-based su=
mmary test report',
+                                         group=3D'view')
+    parser_build.set_defaults(func=3Dmain)
+    parser_build.add_argument('git_branch', help=3D'Git branch to be used =
to compute test summary report')
+    parser_build.add_argument('-g', '--git_repo', default=3D'default', hel=
p=3D'(Optional) Full path to the git repository to be used to compute the t=
est summary report, default will be <top_dir>/test-result-log.git')
+    parser_build.add_argument('-i', '--show_completion', action=3D'store_t=
rue', help=3D'(Optional) To show completion test case and its statistic')
diff --git a/scripts/test-result-log b/scripts/test-result-log
new file mode 100755
index 0000000..bea4324
--- /dev/null
+++ b/scripts/test-result-log
@@ -0,0 +1,84 @@
+#!/usr/bin/python3
+# As part of the initiative to provide LITE version Test Case Management S=
ystem
+# with command-line and plain-text files (eg. manual test case file, test =
plan
+# file to specify list of test case to be executed, test result and log fi=
le)
+# to replace Testopia.
+# Test-result-log script was designed as part of the helper script for bel=
ow purpose:
+# 1. To store test result & log file inside git repository
+# 2. To view text-based test summary report
+#
+import os
+import sys
+import argparse
+script_path =3D os.path.dirname(os.path.realpath(__file__))
+lib_path =3D script_path + '/lib'
+sys.path =3D sys.path + [lib_path]
+import argparse_oe
+import testresultlog.storeauto
+import testresultlog.view
+
+def _get_git_dir(git_dir):
+    base_path =3D script_path + '/..'
+    if git_dir =3D=3D 'default':
+        git_dir =3D os.path.join(base_path, 'test-result-log.git')
+    return git_dir
+
+def _get_oe_dir(oe_dir):
+    base_path =3D script_path + '/..'
+    if oe_dir =3D=3D 'default':
+        oe_dir =3D base_path
+    return oe_dir
+
+def _get_oeqa_case_dir(oe_dir, source):
+    if source =3D=3D 'runtime':
+        case_dir =3D os.path.join(oe_dir, 'meta/lib/oeqa/runtime/cases')
+    elif source =3D=3D 'selftest':
+        case_dir =3D os.path.join(oe_dir, 'meta/lib/oeqa/selftest/cases')
+    elif source =3D=3D 'sdk':
+        case_dir =3D os.path.join(oe_dir, 'meta/lib/oeqa/sdk/cases')
+    else:
+        case_dir =3D os.path.join(oe_dir, 'meta/lib/oeqa/sdkext/cases')
+    return case_dir
+
+def _get_default_attribute_value(attribute_value):
+    if attribute_value =3D=3D 'default':
+        attribute_value =3D ''
+    return attribute_value
+
+def _set_args_attribute_default_value(args):
+    if getattr(args, "environment_list", False):
+        args.environment_list =3D _get_default_attribute_value(args.enviro=
nment_list)
+    if getattr(args, "git_remote", False):
+        args.git_remote =3D _get_default_attribute_value(args.git_remote)
+    if getattr(args, "testcase_remove_file", False):
+        args.testcase_remove_file =3D _get_default_attribute_value(args.te=
stcase_remove_file)
+
+def main():
+    parser =3D argparse_oe.ArgumentParser(description=3D"OpenEmbedded test=
case management tool, to store test result then to view test summary report=
.",
+                                        add_help=3DFalse,
+                                        epilog=3D"Use %(prog)s <subcommand=
> --help to get help on a specific command")
+    parser.add_argument('-h', '--help', action=3D'help', default=3Dargpars=
e.SUPPRESS,
+                        help=3D'show this help message and exit')
+    subparsers =3D parser.add_subparsers(dest=3D"subparser_name", title=3D=
'subcommands', metavar=3D'<subcommand>')
+    subparsers.required =3D True
+    subparsers.add_subparser_group('store', 'Store test result', 100)
+    subparsers.add_subparser_group('view', 'Analyze test result', -1)
+    subparsers.add_subparser_group('testplan', 'Plan test', 1000)
+    testresultlog.storeauto.register_commands(subparsers)
+    testresultlog.view.register_commands(subparsers)
+    args =3D parser.parse_args()
+    if getattr(args, "git_repo", False):
+        args.git_repo =3D _get_git_dir(args.git_repo)
+    if getattr(args, "oe_dir", False):
+        args.oe_dir =3D _get_oe_dir(args.oe_dir)
+        args.case_dir =3D _get_oeqa_case_dir(args.oe_dir, args.source)
+    _set_args_attribute_default_value(args)
+
+    try:
+        ret =3D args.func(args)
+    except argparse_oe.ArgumentUsageError as ae:
+        parser.error_subcommand(ae.message, ae.subcommand)
+    return ret
+
+if __name__ =3D=3D "__main__":
+    sys.exit(main())
--=20
2.7.4


