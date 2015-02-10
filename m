Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 53E916E593
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1AHkhWW021409 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:46:43 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CHBUip11xBdc
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:46:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1AHkTYv021402
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:46:40 GMT
Message-ID: <1423590389.20217.46.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Feb 2015 17:46:29 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] libtool: Fix option parsing performance regression
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
X-List-Received-Date: Tue, 10 Feb 2015 17:46:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Cut and paste the pieces of build-aux/options-parser inline into the main
ltmain.sh code. This removes a performance degradation caused by the 
repeated calls to func_quote_for_eval, the mechanism funclib uses
to construct the functions used for option parsing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.5.inc b/meta/recipes-devtools/libtool/libtool-2.4.5.inc
index 17169f7..4bc1aa8 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.5.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.5.inc
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://fix-resolve-lt-sysroot.patch \
            file://nohardcodepaths.patch \
            file://avoid-running-automake-autoconf-version.patch \
+           file://unwind-opt-parsing.patch \
           "
 
 SRC_URI[md5sum] = "7d30ed9fa6bb11270ebb31639a37bd54"
diff --git a/meta/recipes-devtools/libtool/libtool/unwind-opt-parsing.patch b/meta/recipes-devtools/libtool/libtool/unwind-opt-parsing.patch
new file mode 100644
index 0000000..d87e01e
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/unwind-opt-parsing.patch
@@ -0,0 +1,179 @@
+Cut and paste the pieces of build-aux/options-parser inline into the main
+ltmain.sh code. This removes a performance degradation caused by the 
+repeated calls to func_quote_for_eval, the mechanism funclib uses
+to construct the functions used for option parsing.
+
+Upstream-Status: Submitted [Being discussed on mailing list Feb 2015]
+
+diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
+index d5cf07a..0f54303 100644
+--- a/build-aux/ltmain.in
++++ b/build-aux/ltmain.in
+@@ -342,11 +342,15 @@ _LT_EOF
+ # libtool_options_prep [ARG]...
+ # -----------------------------
+ # Preparation for options parsed by libtool.
+-libtool_options_prep ()
+-{
++#libtool_options_prep ()
++#{
+     $debug_mode
+ 
+     # Option defaults:
++    opt_verbose=false
++    opt_warning_types=
++
++    # Option defaults:
+     opt_config=false
+     opt_dlopen=
+     opt_dry_run=false
+@@ -382,19 +386,14 @@ libtool_options_prep ()
+       shift; set dummy --mode uninstall ${1+"$@"}; shift
+       ;;
+     esac
+-
+-    # Pass back the list of options.
+-    func_quote_for_eval ${1+"$@"}
+-    libtool_options_prep_result=$func_quote_for_eval_result
+-}
+-func_add_hook func_options_prep libtool_options_prep
++#}
+ 
+ 
+ # libtool_parse_options [ARG]...
+ # ---------------------------------
+ # Provide handling for libtool specific options.
+-libtool_parse_options ()
+-{
++#libtool_parse_options ()
++#{
+     $debug_cmd
+ 
+     # Perform our own loop to consume as many options as possible in
+@@ -474,29 +473,90 @@ libtool_parse_options ()
+                         func_append preserve_args " $_G_opt"
+                         ;;
+ 
+-	# An option not handled by this hook function:
+-        *)		set dummy "$_G_opt" ${1+"$@"};	shift; break  ;;
+-      esac
+-    done
++        --debug|-x)   debug_cmd='set -x'
++                      func_echo "enabling shell trace mode"
++                      $debug_cmd
++                      ;;
+ 
++        --no-warnings|--no-warning|--no-warn)
++                      set dummy --warnings none ${1+"$@"}
++                      shift
++		      ;;
+ 
+-    # save modified positional parameters for caller
+-    func_quote_for_eval ${1+"$@"}
+-    libtool_parse_options_result=$func_quote_for_eval_result
+-}
+-func_add_hook func_parse_options libtool_parse_options
++        --warnings|--warning|-W)
++                      test $# = 0 && func_missing_arg $_G_opt && break
++                      case " $warning_categories $1" in
++                        *" $1 "*)
++                          # trailing space prevents matching last $1 above
++                          func_append_uniq opt_warning_types " $1"
++                          ;;
++                        *all)
++                          opt_warning_types=$warning_categories
++                          ;;
++                        *none)
++                          opt_warning_types=none
++                          warning_func=:
++                          ;;
++                        *error)
++                          opt_warning_types=$warning_categories
++                          warning_func=func_fatal_error
++                          ;;
++                        *)
++                          func_fatal_error \
++                             "unsupported warning category: '$1'"
++                          ;;
++                      esac
++                      shift
++                      ;;
++
++        --verbose|-v) opt_verbose=: ;;
++        --version)    func_version ;;
++        -\?|-h)       func_usage ;;
++        --help)       func_help ;;
++
++	# Separate optargs to long options (plugins may need this):
++	--*=*)        func_split_equals "$_G_opt"
++	              set dummy "$func_split_equals_lhs" \
++                          "$func_split_equals_rhs" ${1+"$@"}
++                      shift
++                      ;;
++
++       # Separate optargs to short options:
++        -W*)
++                      func_split_short_opt "$_G_opt"
++                      set dummy "$func_split_short_opt_name" \
++                          "$func_split_short_opt_arg" ${1+"$@"}
++                      shift
++                      ;;
++
++        # Separate non-argument short options:
++        -\?*|-h*|-v*|-x*)
++                      func_split_short_opt "$_G_opt"
++                      set dummy "$func_split_short_opt_name" \
++                          "-$func_split_short_opt_arg" ${1+"$@"}
++                      shift
++                      ;;
++
++        --)           break ;;
++        -*)           func_fatal_help "unrecognised option: '$_G_opt'" ;;
++        *)            set dummy "$_G_opt" ${1+"$@"}; shift; break ;;
++      esac
++    done
++#}
+ 
++# Display all warnings if -W was not given.
++test -n "$opt_warning_types" || opt_warning_types=" $warning_categories"
+ 
+ 
+ # libtool_validate_options [ARG]...
+ # ---------------------------------
+ # Perform any sanity checks on option settings and/or unconsumed
+ # arguments.
+-libtool_validate_options ()
+-{
++#libtool_validate_options ()
++#{
+     # save first non-option argument
+     if test 0 -lt $#; then
+-      nonopt=$1
++      nonopt=$_G_opt
+       shift
+     fi
+ 
+@@ -537,20 +597,10 @@ libtool_validate_options ()
+       generic_help=$help
+       help="Try '$progname --help --mode=$opt_mode' for more information."
+     }
++#}
+ 
+-    # Pass back the unparsed argument list
+-    func_quote_for_eval ${1+"$@"}
+-    libtool_validate_options_result=$func_quote_for_eval_result
+-}
+-func_add_hook func_validate_options libtool_validate_options
+-
+-
+-# Process options as early as possible so that --help and --version
+-# can return quickly.
+-func_options ${1+"$@"}
+-eval set dummy "$func_options_result"; shift
+-
+-
++# Bail if the options were screwed!
++$exit_cmd $EXIT_FAILURE
+ 
+ ## ----------- ##
+ ##    Main.    ##



