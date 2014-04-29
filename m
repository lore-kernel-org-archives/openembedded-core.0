Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 957A865CFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 05:37:59 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so5496544eek.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 22:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=54l2he+zzncmFao2d1xbWeZeMHZrLrn8eD2yJSf0RFs=;
	b=SctvcvkW6aS04R8wCL8ZOJT2z6gufG14fBJbPFj4QkndSDMAeJ4OJ8jKVcAobelbLz
	STHRkN4tu15dp9DAa3x3KVO0VJteYjBl+sEdCuK8Rm6E9T15p4cJQCu7H9Qlc9H3uvG+
	1c/2jkuaj67oi24yABes7SRomMv61wgK03NiZp75zvx7m6wbm6ZqqhuTg/UtDeVHb1lm
	JVCXLPdjAceArXQuqeNW032CvB0tnkhVAG+/mRvMc+4aE8wVaEjGFpTnnVwbeGc1QZ46
	Pqp5nXpw1732fkZ1gjwgD27NRqeA3UgCSe6/j+v36mlYxbcjFvZL+TIwIQhHlJjbU2VU
	jIfg==
X-Gm-Message-State: ALoCoQlijF/kEOCtULoxMuSC2DIC9w959oCWKNna2ujB3GJOYRtGbBa7Rghwvd/rGOmXbjno4Fdk
X-Received: by 10.14.224.6 with SMTP id w6mr965066eep.60.1398749879846;
	Mon, 28 Apr 2014 22:37:59 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	x45sm56143164eeu.23.2014.04.28.22.37.58 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Apr 2014 22:37:59 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 07:37:54 +0200
Message-Id: <1398749875-32207-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] xdg-utils: reinstall xdg-terminal
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
X-List-Received-Date: Tue, 29 Apr 2014 05:38:03 -0000

It's being used by e.g. gnome-session when Terminal=true is set in
.desktop files, like xinput-calibrator does.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../xdg-utils/0001-Reinstate-xdg-terminal.patch    | 672 +++++++++++++++++++++
 .../xdg-utils/xdg-utils_1.1.0-rc1.bb               |   5 +-
 2 files changed, 676 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/0001-Reinstate-xdg-terminal.patch

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils/0001-Reinstate-xdg-terminal.patch b/meta/recipes-extended/xdg-utils/xdg-utils/0001-Reinstate-xdg-terminal.patch
new file mode 100644
index 0000000..6d5cc2f
--- /dev/null
+++ b/meta/recipes-extended/xdg-utils/xdg-utils/0001-Reinstate-xdg-terminal.patch
@@ -0,0 +1,672 @@
+From 174aa7206f4b308d4d2292bb8067a07d8cc715c0 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 29 Apr 2014 07:29:32 +0200
+Subject: [PATCH] Reinstate xdg-terminal
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
+Upstream-status: Inappropriate [Revert]
+---
+ scripts/Makefile.in  |   6 +-
+ scripts/xdg-terminal | 622 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 625 insertions(+), 3 deletions(-)
+ create mode 100755 scripts/xdg-terminal
+
+diff --git a/scripts/Makefile.in b/scripts/Makefile.in
+index 2c7d2ac..bef10d1 100644
+--- a/scripts/Makefile.in
++++ b/scripts/Makefile.in
+@@ -20,11 +20,11 @@ SCRIPTS		= \
+     xdg-open \
+     xdg-email \
+     xdg-screensaver \
+-    xdg-settings
++    xdg-settings \
++    xdg-terminal
+ #    xdg-su
+ #    xdg-copy \
+ #    xdg-file-dialog
+-#    xdg-terminal
+ 
+ MANPAGES=	$(SCRIPTS:%=man/%.1)
+ WEBPAGES=	$(SCRIPTS:%=%.html)
+@@ -42,7 +42,7 @@ release:	scripts html man
+ 	rm -f xdg-*.in *~ HACKING generate-help-script.awk
+ 	rm -rf desc/
+ 	rm -rf xsl/
+-	rm -f xdg-file-dialog xdg-su xdg-copy xdg-terminal
++	rm -f xdg-file-dialog xdg-su xdg-copy
+ 
+ distclean: clean
+ 	rm -f Makefile
+diff --git a/scripts/xdg-terminal b/scripts/xdg-terminal
+new file mode 100755
+index 0000000..4bd9205
+--- /dev/null
++++ b/scripts/xdg-terminal
+@@ -0,0 +1,622 @@
++#!/bin/sh
++#---------------------------------------------
++#   xdg-terminal
++#
++#   Utility script to open the registered terminal emulator
++#
++#   Refer to the usage() function below for usage.
++#
++#   Copyright 2009-2010, Fathi Boudra <fabo@freedesktop.org>
++#   Copyright 2009-2010, Rex Dieter <rdieter@fedoraproject.org>
++#   Copyright 2006, Kevin Krammer <kevin.krammer@gmx.at>
++#
++#   LICENSE:
++#
++#   Permission is hereby granted, free of charge, to any person obtaining a
++#   copy of this software and associated documentation files (the "Software"),
++#   to deal in the Software without restriction, including without limitation
++#   the rights to use, copy, modify, merge, publish, distribute, sublicense,
++#   and/or sell copies of the Software, and to permit persons to whom the
++#   Software is furnished to do so, subject to the following conditions:
++#
++#   The above copyright notice and this permission notice shall be included
++#   in all copies or substantial portions of the Software.
++#
++#   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++#   OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++#   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
++#   THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
++#   OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
++#   ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
++#   OTHER DEALINGS IN THE SOFTWARE.
++#
++#---------------------------------------------
++
++manualpage()
++{
++cat << _MANUALPAGE
++Name
++
++   xdg-terminal - opens the user's preferred terminal emulator application
++
++Synopsis
++
++   xdg-terminal [command]
++
++   xdg-terminal { --help | --manual | --version }
++
++Description
++
++   xdg-terminal opens the user's preferred terminal emulator application. If
++   a command is provided the command will be executed by the shell within the
++   newly opened terminal window.
++
++   xdg-terminal is for use inside a desktop session only. It is not
++   recommended to use xdg-terminal as root.
++
++Options
++
++   --help
++           Show command synopsis.
++
++   --manual
++           Show this manual page.
++
++   --version
++           Show the xdg-utils version information.
++
++Exit Codes
++
++   An exit code of 0 indicates success while a non-zero exit code indicates
++   failure. The following failure codes can be returned:
++
++   1
++           Error in command line syntax.
++
++   3
++           A required tool could not be found.
++
++   4
++           The action failed.
++
++Examples
++
++ xdg-terminal
++
++   Opens the user's default terminal emulator, just starting an interactive
++   shell.
++
++ xdg-terminal top
++
++   Opens the user's default terminal emulator and lets it run the top
++   executable.
++_MANUALPAGE
++}
++
++usage()
++{
++cat << _USAGE
++   xdg-terminal - opens the user's preferred terminal emulator application
++
++Synopsis
++
++   xdg-terminal [command]
++
++   xdg-terminal { --help | --manual | --version }
++
++_USAGE
++}
++
++#@xdg-utils-common@
++
++#----------------------------------------------------------------------------
++#   Common utility functions included in all XDG wrapper scripts
++#----------------------------------------------------------------------------
++
++DEBUG()
++{
++  [ -z "${XDG_UTILS_DEBUG_LEVEL}" ] && return 0;
++  [ ${XDG_UTILS_DEBUG_LEVEL} -lt $1 ] && return 0;
++  shift
++  echo "$@" >&2
++}
++
++# This handles backslashes but not quote marks.
++first_word()
++{
++    read first rest
++    echo "$first"
++}
++
++#-------------------------------------------------------------
++# map a binary to a .desktop file
++binary_to_desktop_file()
++{
++    search="${XDG_DATA_HOME:-$HOME/.local/share}:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
++    binary="`which "$1"`"
++    binary="`readlink -f "$binary"`"
++    base="`basename "$binary"`"
++    IFS=:
++    for dir in $search; do
++        unset IFS
++        [ "$dir" ] || continue
++        [ -d "$dir/applications" ] || [ -d "$dir/applnk" ] || continue
++        for file in "$dir"/applications/*.desktop "$dir"/applications/*/*.desktop "$dir"/applnk/*.desktop "$dir"/applnk/*/*.desktop; do
++            [ -r "$file" ] || continue
++            # Check to make sure it's worth the processing.
++            grep -q "^Exec.*$base" "$file" || continue
++            # Make sure it's a visible desktop file (e.g. not "preferred-web-browser.desktop").
++            grep -Eq "^(NoDisplay|Hidden)=true" "$file" && continue
++            command="`grep -E "^Exec(\[[^]=]*])?=" "$file" | cut -d= -f 2- | first_word`"
++            command="`which "$command"`"
++            if [ x"`readlink -f "$command"`" = x"$binary" ]; then
++                # Fix any double slashes that got added path composition
++                echo "$file" | sed -e 's,//*,/,g'
++                return
++            fi
++        done
++    done
++}
++
++#-------------------------------------------------------------
++# map a .desktop file to a binary
++## FIXME: handle vendor dir case
++desktop_file_to_binary()
++{
++    search="${XDG_DATA_HOME:-$HOME/.local/share}:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
++    desktop="`basename "$1"`"
++    IFS=:
++    for dir in $search; do
++        unset IFS
++        [ "$dir" ] && [ -d "$dir/applications" ] || continue
++        file="$dir/applications/$desktop"
++        [ -r "$file" ] || continue
++        # Remove any arguments (%F, %f, %U, %u, etc.).
++        command="`grep -E "^Exec(\[[^]=]*])?=" "$file" | cut -d= -f 2- | first_word`"
++        command="`which "$command"`"
++        readlink -f "$command"
++        return
++    done
++}
++
++#-------------------------------------------------------------
++# Exit script on successfully completing the desired operation
++
++exit_success()
++{
++    if [ $# -gt 0 ]; then
++        echo "$@"
++        echo
++    fi
++
++    exit 0
++}
++
++
++#-----------------------------------------
++# Exit script on malformed arguments, not enough arguments
++# or missing required option.
++# prints usage information
++
++exit_failure_syntax()
++{
++    if [ $# -gt 0 ]; then
++        echo "xdg-terminal: $@" >&2
++        echo "Try 'xdg-terminal --help' for more information." >&2
++    else
++        usage
++        echo "Use 'man xdg-terminal' or 'xdg-terminal --manual' for additional info."
++    fi
++
++    exit 1
++}
++
++#-------------------------------------------------------------
++# Exit script on missing file specified on command line
++
++exit_failure_file_missing()
++{
++    if [ $# -gt 0 ]; then
++        echo "xdg-terminal: $@" >&2
++    fi
++
++    exit 2
++}
++
++#-------------------------------------------------------------
++# Exit script on failure to locate necessary tool applications
++
++exit_failure_operation_impossible()
++{
++    if [ $# -gt 0 ]; then
++        echo "xdg-terminal: $@" >&2
++    fi
++
++    exit 3
++}
++
++#-------------------------------------------------------------
++# Exit script on failure returned by a tool application
++
++exit_failure_operation_failed()
++{
++    if [ $# -gt 0 ]; then
++        echo "xdg-terminal: $@" >&2
++    fi
++
++    exit 4
++}
++
++#------------------------------------------------------------
++# Exit script on insufficient permission to read a specified file
++
++exit_failure_file_permission_read()
++{
++    if [ $# -gt 0 ]; then
++        echo "xdg-terminal: $@" >&2
++    fi
++
++    exit 5
++}
++
++#------------------------------------------------------------
++# Exit script on insufficient permission to write a specified file
++
++exit_failure_file_permission_write()
++{
++    if [ $# -gt 0 ]; then
++        echo "xdg-terminal: $@" >&2
++    fi
++
++    exit 6
++}
++
++check_input_file()
++{
++    if [ ! -e "$1" ]; then
++        exit_failure_file_missing "file '$1' does not exist"
++    fi
++    if [ ! -r "$1" ]; then
++        exit_failure_file_permission_read "no permission to read file '$1'"
++    fi
++}
++
++check_vendor_prefix()
++{
++    file_label="$2"
++    [ -n "$file_label" ] || file_label="filename"
++    file=`basename "$1"`
++    case "$file" in
++       [[:alpha:]]*-*)
++         return
++         ;;
++    esac
++
++    echo "xdg-terminal: $file_label '$file' does not have a proper vendor prefix" >&2
++    echo 'A vendor prefix consists of alpha characters ([a-zA-Z]) and is terminated' >&2
++    echo 'with a dash ("-"). An example '"$file_label"' is '"'example-$file'" >&2
++    echo "Use --novendor to override or 'xdg-terminal --manual' for additional info." >&2
++    exit 1
++}
++
++check_output_file()
++{
++    # if the file exists, check if it is writeable
++    # if it does not exists, check if we are allowed to write on the directory
++    if [ -e "$1" ]; then
++        if [ ! -w "$1" ]; then
++            exit_failure_file_permission_write "no permission to write to file '$1'"
++        fi
++    else
++        DIR=`dirname "$1"`
++        if [ ! -w "$DIR" ] || [ ! -x "$DIR" ]; then
++            exit_failure_file_permission_write "no permission to create file '$1'"
++        fi
++    fi
++}
++
++#----------------------------------------
++# Checks for shared commands, e.g. --help
++
++check_common_commands()
++{
++    while [ $# -gt 0 ] ; do
++        parm="$1"
++        shift
++
++        case "$parm" in
++            --help)
++            usage
++            echo "Use 'man xdg-terminal' or 'xdg-terminal --manual' for additional info."
++            exit_success
++            ;;
++
++            --manual)
++            manualpage
++            exit_success
++            ;;
++
++            --version)
++            echo "xdg-terminal 1.1.0 rc1"
++            exit_success
++            ;;
++        esac
++    done
++}
++
++check_common_commands "$@"
++
++[ -z "${XDG_UTILS_DEBUG_LEVEL}" ] && unset XDG_UTILS_DEBUG_LEVEL;
++if [ ${XDG_UTILS_DEBUG_LEVEL-0} -lt 1 ]; then
++    # Be silent
++    xdg_redirect_output=" > /dev/null 2> /dev/null"
++else
++    # All output to stderr
++    xdg_redirect_output=" >&2"
++fi
++
++#--------------------------------------
++# Checks for known desktop environments
++# set variable DE to the desktop environments name, lowercase
++
++detectDE()
++{
++    # see https://bugs.freedesktop.org/show_bug.cgi?id=34164
++    unset GREP_OPTIONS
++
++    if [ -n "${XDG_CURRENT_DESKTOP}" ]; then
++      case "${XDG_CURRENT_DESKTOP}" in
++         ENLIGHTENMENT)
++           DE=enlightenment;
++           ;;
++         GNOME)
++           DE=gnome;
++           ;;
++         KDE)
++           DE=kde;
++           ;;
++         LXDE)
++           DE=lxde;
++           ;;
++         MATE)
++           DE=mate;
++           ;;
++         XFCE)
++           DE=xfce
++           ;;
++      esac
++    fi
++
++    if [ x"$DE" = x"" ]; then
++      # classic fallbacks
++      if [ x"$KDE_FULL_SESSION" != x"" ]; then DE=kde;
++      elif [ x"$GNOME_DESKTOP_SESSION_ID" != x"" ]; then DE=gnome;
++      elif [ x"$MATE_DESKTOP_SESSION_ID" != x"" ]; then DE=mate;
++      elif `dbus-send --print-reply --dest=org.freedesktop.DBus /org/freedesktop/DBus org.freedesktop.DBus.GetNameOwner string:org.gnome.SessionManager > /dev/null 2>&1` ; then DE=gnome;
++      elif xprop -root _DT_SAVE_MODE 2> /dev/null | grep ' = \"xfce4\"$' >/dev/null 2>&1; then DE=xfce;
++      elif xprop -root 2> /dev/null | grep -i '^xfce_desktop_window' >/dev/null 2>&1; then DE=xfce
++      elif echo $DESKTOP | grep -q '^Enlightenment'; then DE=enlightenment;
++      fi
++    fi
++
++    if [ x"$DE" = x"" ]; then
++      # fallback to checking $DESKTOP_SESSION
++      case "$DESKTOP_SESSION" in
++         gnome)
++           DE=gnome;
++           ;;
++         LXDE|Lubuntu)
++           DE=lxde; 
++           ;;
++         MATE)
++           DE=mate;
++           ;;
++         xfce|xfce4|'Xfce Session')
++           DE=xfce;
++           ;;
++      esac
++    fi
++
++    if [ x"$DE" = x"" ]; then
++      # fallback to uname output for other platforms
++      case "$(uname 2>/dev/null)" in 
++        Darwin)
++          DE=darwin;
++          ;;
++      esac
++    fi
++
++    if [ x"$DE" = x"gnome" ]; then
++      # gnome-default-applications-properties is only available in GNOME 2.x
++      # but not in GNOME 3.x
++      which gnome-default-applications-properties > /dev/null 2>&1  || DE="gnome3"
++    fi
++}
++
++#----------------------------------------------------------------------------
++# kfmclient exec/openURL can give bogus exit value in KDE <= 3.5.4
++# It also always returns 1 in KDE 3.4 and earlier
++# Simply return 0 in such case
++
++kfmclient_fix_exit_code()
++{
++    version=`LC_ALL=C.UTF-8 kde-config --version 2>/dev/null | grep '^KDE'`
++    major=`echo $version | sed 's/KDE.*: \([0-9]\).*/\1/'`
++    minor=`echo $version | sed 's/KDE.*: [0-9]*\.\([0-9]\).*/\1/'`
++    release=`echo $version | sed 's/KDE.*: [0-9]*\.[0-9]*\.\([0-9]\).*/\1/'`
++    test "$major" -gt 3 && return $1
++    test "$minor" -gt 5 && return $1
++    test "$release" -gt 4 && return $1
++    return 0
++}
++
++terminal_kde()
++{
++    terminal=`kreadconfig --file kdeglobals --group General --key TerminalApplication --default konsole`
++
++    terminal_exec=`which $terminal 2>/dev/null`
++
++    if [ -x "$terminal_exec" ]; then
++        if [ x"$1" = x"" ]; then
++            $terminal_exec
++        else
++            $terminal_exec -e "$1"
++        fi
++
++        if [ $? -eq 0 ]; then
++            exit_success
++        else
++            exit_failure_operation_failed
++        fi
++    else
++        exit_failure_operation_impossible "configured terminal program '$terminal' not found or not executable"
++    fi
++}
++
++terminal_gnome()
++{
++    term_exec_key="/desktop/gnome/applications/terminal/exec"
++    term_exec_arg_key="/desktop/gnome/applications/terminal/exec_arg"
++
++    term_exec=`gconftool-2 --get ${term_exec_key}`
++    term_exec_arg=`gconftool-2 --get ${term_exec_arg_key}`
++
++    terminal_exec=`which $term_exec 2>/dev/null`
++
++    if [ -x "$terminal_exec" ]; then
++        if [ x"$1" = x"" ]; then
++            $terminal_exec
++        else
++            if [ x"$term_exec_arg" = x"" ]; then
++                $terminal_exec "$1"
++            else
++                $terminal_exec "$term_exec_arg" "$1"
++            fi
++        fi
++
++        if [ $? -eq 0 ]; then
++            exit_success
++        else
++            exit_failure_operation_failed
++        fi
++    else
++        exit_failure_operation_impossible "configured terminal program '$term_exec' not found or not executable"
++    fi
++}
++
++terminal_xfce()
++{
++    if [ x"$1" = x"" ]; then
++        exo-open --launch TerminalEmulator
++    else
++        exo-open --launch TerminalEmulator "$1"
++    fi
++
++    if [ $? -eq 0 ]; then
++        exit_success
++    else
++        exit_failure_operation_failed
++    fi
++}
++
++terminal_generic()
++{
++    # if $TERM is a known non-command, use hard-coded fallbacks
++    if [ x"$TERM" = x"" ] || [ x"$TERM" = x"linux" ] || [ x"$TERM" = x"vt100" ]; then
++        TERM=xterm
++    fi
++
++    terminal_exec=`which $TERM 2>/dev/null`
++
++    if [ -x "$terminal_exec" ]; then
++        if [ x"$1" = x"" ]; then
++            $terminal_exec
++        else
++            # screen and urxvt won't do their own parsing of quoted arguments
++            if [ x"$TERM" = x"screen" ]; then
++                # screen has an incompatible meaning for -e
++                sh -c "exec $terminal_exec $1"
++            elif [ x"$TERM" = x"urxvt" ] || [ x"$TERM" = x"rxvt-unicode" ] || [ x"$TERM" = x"rxvt" ]; then
++                #TODO: Use whatever mechanism dash supports to test for
++                #      rxvt-* to match things like rxvt-unicode-256color
++                sh -c "exec $terminal_exec -e $1"
++            else
++                $terminal_exec -e "$1"
++            fi
++        fi
++
++        if [ $? -eq 0 ]; then
++            exit_success
++        else
++            exit_failure_operation_failed
++        fi
++    else
++        exit_failure_operation_impossible "configured terminal program '$TERM' not found or not executable"
++    fi
++}
++
++terminal_lxde()
++{
++    if which lxterminal &>/dev/null; then
++        if [ x"$1" = x"" ]; then
++            lxterminal
++        else
++            lxterminal -e "$1"
++        fi
++    else
++        terminal_generic "$1"
++    fi
++}
++
++#[ x"$1" != x"" ] || exit_failure_syntax
++
++command=
++while [ $# -gt 0 ] ; do
++    parm="$1"
++    shift
++
++    case "$parm" in
++      -*)
++        exit_failure_syntax "unexpected option '$parm'"
++        ;;
++
++      *)
++        if [ -n "$command" ] ; then
++            exit_failure_syntax "unexpected argument '$parm'"
++        fi
++        command="$parm"
++        ;;
++    esac
++done
++
++detectDE
++
++if [ x"$DE" = x"" ]; then
++    DE=generic
++fi
++
++case "$DE" in
++    kde)
++    terminal_kde "$command"
++    ;;
++
++    gnome*)
++    terminal_gnome "$command"
++    ;;
++
++    xfce)
++    terminal_xfce "$command"
++    ;;
++
++    lxde)
++    terminal_lxde "$command"
++    ;;
++
++    generic)
++    terminal_generic "$command"
++    ;;
++
++    *)
++    exit_failure_operation_impossible "no terminal emulator available"
++    ;;
++esac
+-- 
+1.9.0
+
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
index 7969879..2ac979b 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
@@ -11,12 +11,15 @@ xdg-icon-resource \
 xdg-mime \       
 xdg-open \     
 xdg-screensaver \ 
+xdg-terminal \
 "
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a5367a90934098d6b05af3b746405014"
 
-SRC_URI = "http://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz"
+SRC_URI = "http://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
+           file://0001-Reinstate-xdg-terminal.patch \
+          "
 
 SRC_URI[md5sum] = "fadf5e7a08e0526fc60dbe3e5b7ef8d6"
 SRC_URI[sha256sum] = "7b05558ae4bb8ede356863cae8c42e3e012aa421bf9d45130a570fd209d79102"
-- 
1.9.0


