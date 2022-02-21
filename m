Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Tim Orling" <ticotimo@gmail.com>
Subject: [PATCH 05/19] python3-wheel: inherit flit_core
Date: Sun, 20 Feb 2022 17:27:34 -0800
Message-Id: <5bbbe338aaaf1628439f7fec51fd75e984cfa5e1.1645405471.git.tim.orling@konsulko.com>
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

Backport pyproject.toml from flit-backend branch.
Inherit flit_core class to build
Inherit pip_install_wheel to install wheels for target

We need to bootstrap python3-wheel-native in order to have bdist_wheel
available to python3-setuptools-native and the refactored
setuptools3.bbclass. Simply unzip the wheel into
PYTHON_SITEPACKAGES_DIR for class-native.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...roject.toml-from-flit-backend-branch.patch | 100 ++++++++++++++++++
 .../python/python3-wheel_0.37.1.bb            |  16 ++-
 2 files changed, 114 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-from-flit-backend-branch.patch

diff --git a/meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-from-flit-backend-branch.patch b/meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-from-flit-backend-branch.patch
new file mode 100644
index 00000000000..023de0e6a88
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-from-flit-backend-branch.patch
@@ -0,0 +1,100 @@
+From f00dd220346773bc088d403847ee7f06f2b4c30a Mon Sep 17 00:00:00 2001
+From: Tim Orling <tim.orling@konsulko.com>
+Date: Fri, 18 Feb 2022 11:09:16 -0800
+Subject: [PATCH] Backport pyproject.toml from flit-backend branch
+
+This allows us to bootstrap wheels and PEP-517 packaging.
+
+Upstream-Status: Backport from flit-backend branch
+https://raw.githubusercontent.com/pypa/wheel/4f6ba78fede38a8d9e35a14e38377a121033afb3/pyproject.toml
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+---
+ pyproject.toml | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 78 insertions(+)
+ create mode 100644 pyproject.toml
+
+diff --git a/pyproject.toml b/pyproject.toml
+new file mode 100644
+index 0000000..749b8de
+--- /dev/null
++++ b/pyproject.toml
+@@ -0,0 +1,78 @@
++[build-system]
++requires = ["flit_core >=3.2,<4"]
++build-backend = "flit_core.buildapi"
++
++[project]
++name = "wheel"
++description = "A built-package format for Python"
++readme = "README.rst"
++classifiers = [
++    "Development Status :: 5 - Production/Stable",
++    "Intended Audience :: Developers",
++    "Topic :: System :: Archiving :: Packaging",
++    "License :: OSI Approved :: MIT License",
++    "Programming Language :: Python",
++    "Programming Language :: Python :: 3 :: Only",
++    "Programming Language :: Python :: 3.7",
++    "Programming Language :: Python :: 3.8",
++    "Programming Language :: Python :: 3.9",
++    "Programming Language :: Python :: 3.10"
++]
++authors = [{name = "Daniel Holth", email = "dholth@fastmail.fm"}]
++maintainers = [{name = "Alex Grönholm", email = "alex.gronholm@nextday.fi"}]
++keywords = ["wheel", "packaging"]
++license = {file = "LICENSE.txt"}
++requires-python = ">=3.7"
++dependencies = [
++    "setuptools >= 45.2.0"
++]
++dynamic = ["version"]
++
++[project.urls]
++Documentation = "https://wheel.readthedocs.io/"
++Changelog = "https://wheel.readthedocs.io/en/stable/news.html"
++"Issue Tracker" = "https://github.com/pypa/wheel/issues"
++
++[project.scripts]
++wheel = "wheel.cli:main"
++
++[project.entry-points."distutils.commands"]
++bdist_wheel = "wheel.bdist_wheel:bdist_wheel"
++
++[project.optional-dependencies]
++test = [
++    "pytest >= 3.0.0"
++]
++
++[tool.flit.sdist]
++exclude = [
++    ".cirrus.yml",
++    ".github/*",
++    ".gitignore",
++    ".pre-commit-config.yaml",
++    ".readthedocs.yml"
++]
++
++[tool.black]
++target-version = ['py37']
++extend-exclude = '''
++^/src/wheel/vendored/
++'''
++
++[tool.isort]
++src_paths = ["src"]
++profile = "black"
++skip_gitignore = true
++
++[tool.flake8]
++max-line-length = 88
++
++[tool.pytest.ini_options]
++testpaths = "tests"
++
++[tool.coverage.run]
++source = ["wheel"]
++omit = ["*/vendored/*"]
++
++[tool.coverage.report]
++show_missing = true
diff --git a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
index 6c7a31db9e7..c7354c9d982 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
@@ -6,7 +6,19 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=8227180126797a01
 
 SRC_URI[sha256sum] = "e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5b8c9e8b65a5e39d49529c1c4"
 
-inherit pypi setuptools3
+inherit flit_core pypi setuptools3-base
 
-BBCLASSEXTEND = "native"
+SRC_URI += " file://0001-Backport-pyproject.toml-from-flit-backend-branch.patch"
+
+DEPENDS:remove:class-native = "python3-pip-native"
+
+do_install:class-native () {
+    # We need to bootstrap python3-wheel-native
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+    PYPA_WHEEL="${B}/dist/${PYPI_PACKAGE}-${PV}-*.whl"
+    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PYPA_WHEEL} || \
+    bbfatal_log "Failed to install"
+}
+
+BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.2

