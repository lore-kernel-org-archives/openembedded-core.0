Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE396AD82
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:40 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id uo1so2760421pbc.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=zBobfCPYkuulSixa+3b3UkJNODriViqoiwZS8MYJtk4=;
	b=Ae6TU7yxbHtl+L8NG6KTOwkC1waDdZ66jIAkTm8QEzkY/sYmJ89Fpl5BUy6JHgF5o9
	v+4TOY3t3uDFNOrXf1At9aS/TKOUY/qt9sNiJwZAwZmDNlrZpqftU6NIyFIDjjAVSeJx
	0IgTNVgAFkZDTjq7rju/Uhh/hN+1ixEIUfyRvt05BK9B3AErnoSBLmzH7joIWHJnflfZ
	Eq6jxhnuEk8UhOrBQzR8Qinmv+DkF1y7Dz/FCpx6jI9CPJaNGyDQAhx6oClfKrp7eza2
	Q8iAfjpD5SAzKyzmoQ4QsQhZQfR5hB17+stCpSh6vfS/kdknGrEYXbpn/Dkx5x8OR4fV
	Ff8Q==
X-Received: by 10.68.139.40 with SMTP id qv8mr5289847pbb.107.1372457081812;
	Fri, 28 Jun 2013 15:04:41 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.40 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:04:00 -0700
Message-Id: <b6900b6ec5ac685dd83dbad438b352e779ad932c.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 15/24] ipython: Add recipes for ipython2 and ipython3
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ipython/001-completer-across-raw-types.patch   |  562 ++++++++++++++++++++
 .../ipython3/001-completer-across-raw-types.patch  |  562 ++++++++++++++++++++
 meta/recipes-devtools/python/ipython3_0.13.1.bb    |   71 +++
 meta/recipes-devtools/python/ipython_0.13.1.bb     |   48 ++
 4 files changed, 1243 insertions(+)
 create mode 100644 meta/recipes-devtools/python/ipython/001-completer-across-raw-types.patch
 create mode 100644 meta/recipes-devtools/python/ipython3/001-completer-across-raw-types.patch
 create mode 100644 meta/recipes-devtools/python/ipython3_0.13.1.bb
 create mode 100644 meta/recipes-devtools/python/ipython_0.13.1.bb

diff --git a/meta/recipes-devtools/python/ipython/001-completer-across-raw-types.patch b/meta/recipes-devtools/python/ipython/001-completer-across-raw-types.patch
new file mode 100644
index 0000000..d753ca3
--- /dev/null
+++ b/meta/recipes-devtools/python/ipython/001-completer-across-raw-types.patch
@@ -0,0 +1,562 @@
+diff --git a/IPython/core/completer.py b/IPython/core/completer.py
+index 8cb2345..076e2fa 100644
+--- a/IPython/core/completer.py
++++ b/IPython/core/completer.py
+@@ -76,14 +76,18 @@ import os
+ import re
+ import shlex
+ import sys
++import types
+ 
+ from IPython.config.configurable import Configurable
+ from IPython.core.error import TryNext
+ from IPython.core.inputsplitter import ESC_MAGIC
++from IPython.core.oinspect import getargspec
+ from IPython.utils import generics
+ from IPython.utils import io
++from IPython.utils import py3compat
+ from IPython.utils.dir2 import dir2
+ from IPython.utils.process import arg_split
++from IPython.utils.py3compat import cast_unicode
+ from IPython.utils.traitlets import CBool, Enum
+ 
+ #-----------------------------------------------------------------------------
+@@ -181,6 +185,26 @@ def compress_user(path, tilde_expand, tilde_val):
+ class Bunch(object): pass
+ 
+ 
++class PostFix(object):
++    """
++    Effectively a static class which encapsulates a bunch of postfix defs.
++    
++    """
++
++    ## delimiters which support the type completers
++    DELIMS = ' \t\n`!@#$^&*=+\\|;:",<>?'
++
++    ## postfix strings for types
++    LIST = '['
++    DICT = "['"
++    CALL = '('
++    OBJ  = '.'
++
++    ## basic callable types
++    CALLABLES = [ types.FunctionType, types.LambdaType, types.MethodType, \
++                  types.BuiltinFunctionType, types.BuiltinMethodType ]
++
++
+ DELIMS = ' \t\n`!@#$^&*()=+[{]}\\|;:\'",<>?'
+ GREEDY_DELIMS = ' \r\n'
+ 
+@@ -200,6 +224,11 @@ class CompletionSplitter(object):
+ 
+     # Private interface
+ 
++    # These are the default-defaults.  They get updated when the postfix
++    # engine is engaged.
++    _preferred_delims = DELIMS
++    _preferred_greedy_delims = GREEDY_DELIMS
++
+     # A string of delimiter characters.  The default value makes sense for
+     # IPython's most typical usage patterns.
+     _delims = DELIMS
+@@ -246,6 +275,34 @@ class Completer(Configurable):
+         """
+     )
+     
++    use_postfix = CBool(False, config=True,
++        help="""Activate postfix indicator
++
++        This will enable the feature to append syntactic notation to matches
++        providing indication as to what type they are.
++
++        Append:
++            (  -  any callable item
++            [  -  any list
++            [' -  any dictionary
++        """
++    )
++
++    postfix_verbose = Enum((0,1,2), default_value=1, config=True,
++        help="""Provide verbose postfix suggestions.
++
++        This is only valid if use_postfix=True.  Verbosity is as follows:
++
++        0 - No postfix notations will be appended until you've isolate a
++            single attribute name.
++        1 - In multiple-completion cases, types deriving from list, dict and
++            functions will have "[", "['" or "(" appended respectively. Detailed
++            operations are made available once a single attribute is determined.
++        2 - Multiple-completion cases will have duplicate or triplicate entries
++            differing only by the "interface" character at the end.  This can
++            make the tab completion lists pretty long.
++        """
++    )
+ 
+     def __init__(self, namespace=None, global_namespace=None, config=None, **kwargs):
+         """Create a new completer for the command line.
+@@ -303,6 +360,289 @@ class Completer(Configurable):
+         except IndexError:
+             return None
+ 
++    def __dict_completions(self, expr, token, cruft, obj):
++        """Provide completion support for keys in a dictionary.
++        """
++        #print("Completer->__dict_completions: t=%s" % (token))
++
++        # merge the token and cruft
++        token += cruft
++        
++        # handle the basic case
++        if (cruft == ""):
++            return ["%s['%s']" % (expr, k) for k in obj.keys()]
++
++        # support the situation where the user started to type ']
++        if cruft.endswith("'"):
++            return [expr + token + cruft + "]"]
++        if cruft.endswith("']"):
++            return [expr + token + cruft]
++
++        # for valid data, match any keys...
++        return ["%s['%s']" % (expr, k) for k in obj.keys() if k.startswith(cruft)]
++
++    def __list_completions(self, expr, token, cruft, obj):
++        """Provide completion support for lists.
++        """
++        entries = len(obj) - 1
++
++        #print("Completer->__list_completions: t=%s l=%d" % (token, entries))
++
++        # if it is already complete, leave it
++        if cruft.endswith("]"):
++            return [expr + token]
++
++        # handle basic case or trash
++        if (cruft == "") or (not cruft.isdigit()):
++            return ["%s[0]" % (expr), "%s[%d]" % (expr, entries)]
++
++        # main algorithm works only if val != 0
++        if int(cruft) == 0:
++            return ["%s[0]" % (expr)]
++            
++        # generate a list of indicies whose first printed chars match
++        sim = []
++        n = 1
++        val = int(cruft)
++        while val*n <= entries:
++            # setup default end points
++            start = val*n
++            end = (val+1) * n
++
++            # account for the possibility that we don't go all the way through
++            if end > entries:
++                end = entries+1;
++
++            # append the next set of data
++            sim += range(start, end)
++                    
++            # present based on base-10
++            n *= 10
++            
++        # create the option list
++        return ["%s[%d]" % (expr, s) for s in sim ]
++
++    def __call_completions(self, expr, token, cruft, obj):
++        """Provide completion support for function calls.
++        """
++        #print("Completer->__call_completions: FIX-ME")
++        matches = []
++        if inspect.isclass(obj):
++            obj = obj.__init__
++        elif (not py3compat.PY3) and type(obj) is types.InstanceType:
++            obj = obj.__call__
++
++        try:
++            hdef = inspect.formatargspec(*getargspec(obj))
++            return cast_unicode(hdef).strip('(').strip(')').split(', ')
++        except:
++            return []
++
++    def __object_completions(self, expr, token, cruft, obj):
++        """Provide completion support for function calls.
++        """
++        #print("Completer->__object_completions:")
++        if token is None:
++            token = ''
++
++        # handle global items
++        if '.' not in expr+token:
++            #print("    global")
++            # provide options for incomplete text
++            subset = dict()
++            n = len(expr)
++            for lst in [keyword.kwlist,
++                        builtins.__dict__.keys(),
++                        self.namespace.keys(),
++                        self.global_namespace.keys()]:
++                for word in lst:
++                    if word[:n] == expr and word != "__builtins__":
++                        obj = self._global_lookup(word)
++                        #subset.append( (obj, word) )
++                        subset[word] = obj
++
++            # manage the ones we actually care about
++            matches = []
++            for k in subset.keys():
++                ss = (subset[k], k)
++                if ss[0] != None:
++                    apl = self._append_postfix(ss[0], ss[1], len(subset.keys()))
++                    for ap in apl:
++                        matches.append(ap)
++                else:
++                    matches.append(ss[1])
++
++            # true matches updated accordingly
++            return matches
++
++        else:
++            #print("    local")
++            # support overridding with __all__ attribute
++            if self.limit_to__all__ and hasattr(obj, '__all__'):
++                words = get__all__entries(obj)
++            else: 
++                words = dir2(obj)
++
++            try:
++                words = generics.complete_object(obj, words)
++            except TryNext:
++                pass
++            except Exception:
++                # Silence errors from completion function
++                #raise # dbg
++                pass
++            
++            # Build match list to return
++            n = len(cruft)
++            res = []
++            subset = []
++
++            # first create a subset -- the ones we care about
++            for w in words:
++                if w[:n] == cruft and hasattr(obj, w):
++                    val = getattr(obj, w)
++                    subset.append( (w, val) )
++
++            # now, setup tha matches
++            for ss in subset:
++                apl = self._append_postfix(ss[1],
++                                           "%s.%s" % (expr, ss[0]),
++                                           len(subset))
++                for ap in apl:
++                    res.append(ap)
++            return res
++        
++    def _append_postfix(self, val, text, total_completions=0):
++        """Figure out what postfix symbol to append.
++        """
++        #print("_append_postfix")
++        
++        # observer the request
++        if not self.use_postfix:
++            #print("    no-post-fix")
++            return [ text ]
++
++        # ignore the postfix additions as preferred
++        if total_completions > 1:
++
++            if self.postfix_verbose == 0:
++                #print("    omit-postfix (%d)" % total_completions)
++                return [ text ]
++
++            elif self.postfix_verbose == 1:
++                if isinstance( val, dict ):
++                    return [ text + PostFix.DICT ]
++                elif isinstance( val, list ):
++                    return [ text + PostFix.LIST ]
++                elif type(val) in PostFix.CALLABLES:
++                    return [ text + PostFix.CALL ]
++                else:
++                    return [ text ]
++
++            else:
++                # fall through and decode EVERYTHING
++                pass
++
++
++        # prepare multiple results
++        items = []
++
++        # handle scalars
++        if isinstance( val, int ) or isinstance( val, float ):
++            items.append( text )                    # scalar itself
++            items.append( text + PostFix.OBJ )      # object completion
++
++        # handle strings
++        elif isinstance( val, str ):
++            items.append( text )                    # scalar itself
++            items.append( text + PostFix.OBJ )      # object completion
++            items.append( text + PostFix.LIST )     # list completion
++            
++        # handle lists
++        elif isinstance( val, list ):
++            items.append( text + PostFix.OBJ )      # object completion
++            items.append( text + PostFix.LIST )     # list completion
++
++        # handle dicts
++        elif isinstance( val, dict ):
++            items.append( text + PostFix.OBJ )      # object completion
++            items.append( text + PostFix.DICT )     # dict completion
++
++        # handle common callables
++        elif type(val) in PostFix.CALLABLES:
++            # skip object completion
++            items.append( text + PostFix.CALL )     # callable completion
++
++        # handle general objects
++        else:
++            # always add its "object" completion
++            items.append( text + PostFix.OBJ )
++
++            # if it is callable, then provide the functional notation
++            if callable(val):
++                items.append( text + PostFix.CALL )
++
++            # is it iterable?
++            if hasattr(val, '__getitem__'):
++                try:
++                    v = val[0]
++                    items.append( text + PostFix.LIST )  # yup, some sort of list
++                except TypeError:
++                    # wrong key type -- must be a general dictionary
++                    items.append( text + PostFix.DICT )
++                except KeyError:
++                    # invalid key -- likely a dictionary
++                    items.append( text + PostFix.DICT )
++                except IndexError:
++                    pass   # empty list -- the object notation will handle it
++
++        return items
++        
++    def _global_lookup(self, text):
++        """This routine searches the global namespace to find the object.
++        """
++        try:
++            obj = eval(text, self.namespace)
++        except:
++            try:
++                obj = eval(text, self.global_namespace)
++            except:
++                obj = None
++        return obj
++
++    def _postfix_completer(self, expr, token, cruft, ns_lookup_fn):
++        """Identify object-type completions.
++        """
++        #print("Completer->_postfix_completer")
++        #print("   e=%s t=%s c=%s" % (expr, token, cruft))
++
++        # the token can be none as a result of the parent RE.
++        if token is None:
++            token = ''
++        
++        # get the object
++        # -- this may not be possible if it is part of a global
++        obj = ns_lookup_fn(expr+token+cruft)
++        if obj:
++            # odjust the params to reflect the new object
++            expr = expr + token + cruft
++            token = ''
++            cruft = ''
++        else:
++            # look up the base item
++            obj = ns_lookup_fn(expr)
++
++        # sort them out
++        if token == PostFix.CALL:
++            return self.__call_completions(expr, token, cruft, obj)
++        elif token == PostFix.DICT:
++            return self.__dict_completions(expr, token, cruft, obj)
++        elif token == PostFix.LIST:
++            return self.__list_completions(expr, token, cruft, obj)
++
++        # treat it as a plain object
++        return self.__object_completions(expr, token, cruft, obj)
++
+     def global_matches(self, text):
+         """Compute matches when text is a simple name.
+ 
+@@ -310,18 +650,19 @@ class Completer(Configurable):
+         defined in self.namespace or self.global_namespace that match.
+ 
+         """
+-        #print 'Completer->global_matches, txt=%r' % text # dbg
+-        matches = []
+-        match_append = matches.append
+-        n = len(text)
+-        for lst in [keyword.kwlist,
+-                    __builtin__.__dict__.keys(),
+-                    self.namespace.keys(),
+-                    self.global_namespace.keys()]:
+-            for word in lst:
+-                if word[:n] == text and word != "__builtins__":
+-                    match_append(word)
+-        return matches
++        #print('Completer->global_matches, txt=%r' % text) # dbg
++
++        # sort out the components
++        m = re.match(r"(\w+)(\[\'|\[|\()?(\S*)$", text)
++        expr = m.group(1)
++        token = m.group(2)
++        cruft = m.group(3)
++
++        # catch the completions across object types
++        matches = self._postfix_completer(expr, token, cruft, self._global_lookup)
++        if matches is not None:
++            return matches
++        return []
+ 
+     def attr_matches(self, text):
+         """Compute matches when text contains a dot.
+@@ -338,44 +679,27 @@ class Completer(Configurable):
+         """
+ 
+         #io.rprint('Completer->attr_matches, txt=%r' % text) # dbg
+-        # Another option, seems to work great. Catches things like ''.<tab>
+-        m = re.match(r"(\S+(\.\w+)*)\.(\w*)$", text)
+-    
+-        if m:
+-            expr, attr = m.group(1, 3)
+-        elif self.greedy:
+-            m2 = re.match(r"(.+)\.(\w*)$", self.line_buffer)
+-            if not m2:
+-                return []
+-            expr, attr = m2.group(1,2)
+-        else:
++
++        pat = r"(\S+(\.\w+)*)(\.|\[\'|\[|\()(\S*)$"
++        m = re.match(pat, text)
++
++        if not m:
++            io.rprint("Failed to match ...")
+             return []
+-    
+-        try:
+-            obj = eval(expr, self.namespace)
+-        except:
+-            try:
+-                obj = eval(expr, self.global_namespace)
+-            except:
+-                return []
+ 
+-        if self.limit_to__all__ and hasattr(obj, '__all__'):
+-            words = get__all__entries(obj)
+-        else: 
+-            words = dir2(obj)
++        # group(0) is the whole string
++        expr = m.group(1)
++        # group(2) is always 'None'
++        token = m.group(3)
++        cruft = m.group(4)
++        #expr, attr = m.group(1, 3)
+ 
+-        try:
+-            words = generics.complete_object(obj, words)
+-        except TryNext:
+-            pass
+-        except Exception:
+-            # Silence errors from completion function
+-            #raise # dbg
+-            pass
+-        # Build match list to return
+-        n = len(attr)
+-        res = ["%s.%s" % (expr, w) for w in words if w[:n] == attr ]
+-        return res
++
++        # catch the completions across object types
++        foo = self._postfix_completer(expr, token, cruft, self._global_lookup)
++        if foo is not None:
++            return foo
++        return []
+ 
+ 
+ def get__all__entries(obj):
+@@ -393,13 +717,34 @@ class IPCompleter(Completer):
+ 
+     def _greedy_changed(self, name, old, new):
+         """update the splitter and readline delims when greedy is changed"""
++        #io.rprint("_greedy_changed: name=%s o=%d n%d" % (name, old, new))
+         if new:
+-            self.splitter.delims = GREEDY_DELIMS
++            self.splitter.delims = self.splitter._preferred_greedy_delims
+         else:
+-            self.splitter.delims = DELIMS
++            self.splitter.delims = self.splitter._preferred_delims
+ 
+         if self.readline:
+             self.readline.set_completer_delims(self.splitter.delims)
++
++    #
++    #  This is the implicit callback for applying changes to the 'use_postfix'
++    # configuration parameter.
++    #
++    def _use_postfix_changed(self, name, old, new):
++        """engage the correct delims
++        """
++        #io.rprint("_use_postfix_changed: name=%s o=%d n%d" % (name, old, new))
++        if new:
++            self.splitter._preferred_delims = PostFix.DELIMS
++        else:
++            self.splitter._preferred_delims = DELIMS
++
++        # update the parser
++        self.splitter.delims = self.splitter._preferred_delims
++
++        # update readline
++        if self.readline:
++            self.readline.set_completer_delims(self.splitter.delims)
+     
+     merge_completions = CBool(True, config=True,
+         help="""Whether to merge completion results into a single list
+@@ -643,24 +988,24 @@ class IPCompleter(Completer):
+         """Match attributes or global python names"""
+         
+         #io.rprint('Completer->python_matches, txt=%r' % text) # dbg
+-        if "." in text:
+-            try:
+-                matches = self.attr_matches(text)
+-                if text.endswith('.') and self.omit__names:
+-                    if self.omit__names == 1:
+-                        # true if txt is _not_ a __ name, false otherwise:
+-                        no__name = (lambda txt:
+-                                    re.match(r'.*\.__.*?__',txt) is None)
+-                    else:
+-                        # true if txt is _not_ a _ name, false otherwise:
+-                        no__name = (lambda txt:
+-                                    re.match(r'.*\._.*?',txt) is None)
+-                    matches = filter(no__name, matches)
+-            except NameError:
+-                # catches <undefined attributes>.<tab>
+-                matches = []
+-        else:
+-            matches = self.global_matches(text)
++        if "." not in text:
++            return self.global_matches(text)
++            
++        try:
++            matches = self.attr_matches(text)
++            if text.endswith('.') and self.omit__names:
++                if self.omit__names == 1:
++                    # true if txt is _not_ a __ name, false otherwise:
++                    no__name = (lambda txt:
++                                re.match(r'.*\.__.*?__',txt) is None)
++                else:
++                    # true if txt is _not_ a _ name, false otherwise:
++                    no__name = (lambda txt:
++                                re.match(r'.*\._.*?',txt) is None)
++                matches = filter(no__name, matches)
++        except NameError:
++            # catches <undefined attributes>.<tab>
++            matches = []
+ 
+         return matches
+ 
diff --git a/meta/recipes-devtools/python/ipython3/001-completer-across-raw-types.patch b/meta/recipes-devtools/python/ipython3/001-completer-across-raw-types.patch
new file mode 100644
index 0000000..d753ca3
--- /dev/null
+++ b/meta/recipes-devtools/python/ipython3/001-completer-across-raw-types.patch
@@ -0,0 +1,562 @@
+diff --git a/IPython/core/completer.py b/IPython/core/completer.py
+index 8cb2345..076e2fa 100644
+--- a/IPython/core/completer.py
++++ b/IPython/core/completer.py
+@@ -76,14 +76,18 @@ import os
+ import re
+ import shlex
+ import sys
++import types
+ 
+ from IPython.config.configurable import Configurable
+ from IPython.core.error import TryNext
+ from IPython.core.inputsplitter import ESC_MAGIC
++from IPython.core.oinspect import getargspec
+ from IPython.utils import generics
+ from IPython.utils import io
++from IPython.utils import py3compat
+ from IPython.utils.dir2 import dir2
+ from IPython.utils.process import arg_split
++from IPython.utils.py3compat import cast_unicode
+ from IPython.utils.traitlets import CBool, Enum
+ 
+ #-----------------------------------------------------------------------------
+@@ -181,6 +185,26 @@ def compress_user(path, tilde_expand, tilde_val):
+ class Bunch(object): pass
+ 
+ 
++class PostFix(object):
++    """
++    Effectively a static class which encapsulates a bunch of postfix defs.
++    
++    """
++
++    ## delimiters which support the type completers
++    DELIMS = ' \t\n`!@#$^&*=+\\|;:",<>?'
++
++    ## postfix strings for types
++    LIST = '['
++    DICT = "['"
++    CALL = '('
++    OBJ  = '.'
++
++    ## basic callable types
++    CALLABLES = [ types.FunctionType, types.LambdaType, types.MethodType, \
++                  types.BuiltinFunctionType, types.BuiltinMethodType ]
++
++
+ DELIMS = ' \t\n`!@#$^&*()=+[{]}\\|;:\'",<>?'
+ GREEDY_DELIMS = ' \r\n'
+ 
+@@ -200,6 +224,11 @@ class CompletionSplitter(object):
+ 
+     # Private interface
+ 
++    # These are the default-defaults.  They get updated when the postfix
++    # engine is engaged.
++    _preferred_delims = DELIMS
++    _preferred_greedy_delims = GREEDY_DELIMS
++
+     # A string of delimiter characters.  The default value makes sense for
+     # IPython's most typical usage patterns.
+     _delims = DELIMS
+@@ -246,6 +275,34 @@ class Completer(Configurable):
+         """
+     )
+     
++    use_postfix = CBool(False, config=True,
++        help="""Activate postfix indicator
++
++        This will enable the feature to append syntactic notation to matches
++        providing indication as to what type they are.
++
++        Append:
++            (  -  any callable item
++            [  -  any list
++            [' -  any dictionary
++        """
++    )
++
++    postfix_verbose = Enum((0,1,2), default_value=1, config=True,
++        help="""Provide verbose postfix suggestions.
++
++        This is only valid if use_postfix=True.  Verbosity is as follows:
++
++        0 - No postfix notations will be appended until you've isolate a
++            single attribute name.
++        1 - In multiple-completion cases, types deriving from list, dict and
++            functions will have "[", "['" or "(" appended respectively. Detailed
++            operations are made available once a single attribute is determined.
++        2 - Multiple-completion cases will have duplicate or triplicate entries
++            differing only by the "interface" character at the end.  This can
++            make the tab completion lists pretty long.
++        """
++    )
+ 
+     def __init__(self, namespace=None, global_namespace=None, config=None, **kwargs):
+         """Create a new completer for the command line.
+@@ -303,6 +360,289 @@ class Completer(Configurable):
+         except IndexError:
+             return None
+ 
++    def __dict_completions(self, expr, token, cruft, obj):
++        """Provide completion support for keys in a dictionary.
++        """
++        #print("Completer->__dict_completions: t=%s" % (token))
++
++        # merge the token and cruft
++        token += cruft
++        
++        # handle the basic case
++        if (cruft == ""):
++            return ["%s['%s']" % (expr, k) for k in obj.keys()]
++
++        # support the situation where the user started to type ']
++        if cruft.endswith("'"):
++            return [expr + token + cruft + "]"]
++        if cruft.endswith("']"):
++            return [expr + token + cruft]
++
++        # for valid data, match any keys...
++        return ["%s['%s']" % (expr, k) for k in obj.keys() if k.startswith(cruft)]
++
++    def __list_completions(self, expr, token, cruft, obj):
++        """Provide completion support for lists.
++        """
++        entries = len(obj) - 1
++
++        #print("Completer->__list_completions: t=%s l=%d" % (token, entries))
++
++        # if it is already complete, leave it
++        if cruft.endswith("]"):
++            return [expr + token]
++
++        # handle basic case or trash
++        if (cruft == "") or (not cruft.isdigit()):
++            return ["%s[0]" % (expr), "%s[%d]" % (expr, entries)]
++
++        # main algorithm works only if val != 0
++        if int(cruft) == 0:
++            return ["%s[0]" % (expr)]
++            
++        # generate a list of indicies whose first printed chars match
++        sim = []
++        n = 1
++        val = int(cruft)
++        while val*n <= entries:
++            # setup default end points
++            start = val*n
++            end = (val+1) * n
++
++            # account for the possibility that we don't go all the way through
++            if end > entries:
++                end = entries+1;
++
++            # append the next set of data
++            sim += range(start, end)
++                    
++            # present based on base-10
++            n *= 10
++            
++        # create the option list
++        return ["%s[%d]" % (expr, s) for s in sim ]
++
++    def __call_completions(self, expr, token, cruft, obj):
++        """Provide completion support for function calls.
++        """
++        #print("Completer->__call_completions: FIX-ME")
++        matches = []
++        if inspect.isclass(obj):
++            obj = obj.__init__
++        elif (not py3compat.PY3) and type(obj) is types.InstanceType:
++            obj = obj.__call__
++
++        try:
++            hdef = inspect.formatargspec(*getargspec(obj))
++            return cast_unicode(hdef).strip('(').strip(')').split(', ')
++        except:
++            return []
++
++    def __object_completions(self, expr, token, cruft, obj):
++        """Provide completion support for function calls.
++        """
++        #print("Completer->__object_completions:")
++        if token is None:
++            token = ''
++
++        # handle global items
++        if '.' not in expr+token:
++            #print("    global")
++            # provide options for incomplete text
++            subset = dict()
++            n = len(expr)
++            for lst in [keyword.kwlist,
++                        builtins.__dict__.keys(),
++                        self.namespace.keys(),
++                        self.global_namespace.keys()]:
++                for word in lst:
++                    if word[:n] == expr and word != "__builtins__":
++                        obj = self._global_lookup(word)
++                        #subset.append( (obj, word) )
++                        subset[word] = obj
++
++            # manage the ones we actually care about
++            matches = []
++            for k in subset.keys():
++                ss = (subset[k], k)
++                if ss[0] != None:
++                    apl = self._append_postfix(ss[0], ss[1], len(subset.keys()))
++                    for ap in apl:
++                        matches.append(ap)
++                else:
++                    matches.append(ss[1])
++
++            # true matches updated accordingly
++            return matches
++
++        else:
++            #print("    local")
++            # support overridding with __all__ attribute
++            if self.limit_to__all__ and hasattr(obj, '__all__'):
++                words = get__all__entries(obj)
++            else: 
++                words = dir2(obj)
++
++            try:
++                words = generics.complete_object(obj, words)
++            except TryNext:
++                pass
++            except Exception:
++                # Silence errors from completion function
++                #raise # dbg
++                pass
++            
++            # Build match list to return
++            n = len(cruft)
++            res = []
++            subset = []
++
++            # first create a subset -- the ones we care about
++            for w in words:
++                if w[:n] == cruft and hasattr(obj, w):
++                    val = getattr(obj, w)
++                    subset.append( (w, val) )
++
++            # now, setup tha matches
++            for ss in subset:
++                apl = self._append_postfix(ss[1],
++                                           "%s.%s" % (expr, ss[0]),
++                                           len(subset))
++                for ap in apl:
++                    res.append(ap)
++            return res
++        
++    def _append_postfix(self, val, text, total_completions=0):
++        """Figure out what postfix symbol to append.
++        """
++        #print("_append_postfix")
++        
++        # observer the request
++        if not self.use_postfix:
++            #print("    no-post-fix")
++            return [ text ]
++
++        # ignore the postfix additions as preferred
++        if total_completions > 1:
++
++            if self.postfix_verbose == 0:
++                #print("    omit-postfix (%d)" % total_completions)
++                return [ text ]
++
++            elif self.postfix_verbose == 1:
++                if isinstance( val, dict ):
++                    return [ text + PostFix.DICT ]
++                elif isinstance( val, list ):
++                    return [ text + PostFix.LIST ]
++                elif type(val) in PostFix.CALLABLES:
++                    return [ text + PostFix.CALL ]
++                else:
++                    return [ text ]
++
++            else:
++                # fall through and decode EVERYTHING
++                pass
++
++
++        # prepare multiple results
++        items = []
++
++        # handle scalars
++        if isinstance( val, int ) or isinstance( val, float ):
++            items.append( text )                    # scalar itself
++            items.append( text + PostFix.OBJ )      # object completion
++
++        # handle strings
++        elif isinstance( val, str ):
++            items.append( text )                    # scalar itself
++            items.append( text + PostFix.OBJ )      # object completion
++            items.append( text + PostFix.LIST )     # list completion
++            
++        # handle lists
++        elif isinstance( val, list ):
++            items.append( text + PostFix.OBJ )      # object completion
++            items.append( text + PostFix.LIST )     # list completion
++
++        # handle dicts
++        elif isinstance( val, dict ):
++            items.append( text + PostFix.OBJ )      # object completion
++            items.append( text + PostFix.DICT )     # dict completion
++
++        # handle common callables
++        elif type(val) in PostFix.CALLABLES:
++            # skip object completion
++            items.append( text + PostFix.CALL )     # callable completion
++
++        # handle general objects
++        else:
++            # always add its "object" completion
++            items.append( text + PostFix.OBJ )
++
++            # if it is callable, then provide the functional notation
++            if callable(val):
++                items.append( text + PostFix.CALL )
++
++            # is it iterable?
++            if hasattr(val, '__getitem__'):
++                try:
++                    v = val[0]
++                    items.append( text + PostFix.LIST )  # yup, some sort of list
++                except TypeError:
++                    # wrong key type -- must be a general dictionary
++                    items.append( text + PostFix.DICT )
++                except KeyError:
++                    # invalid key -- likely a dictionary
++                    items.append( text + PostFix.DICT )
++                except IndexError:
++                    pass   # empty list -- the object notation will handle it
++
++        return items
++        
++    def _global_lookup(self, text):
++        """This routine searches the global namespace to find the object.
++        """
++        try:
++            obj = eval(text, self.namespace)
++        except:
++            try:
++                obj = eval(text, self.global_namespace)
++            except:
++                obj = None
++        return obj
++
++    def _postfix_completer(self, expr, token, cruft, ns_lookup_fn):
++        """Identify object-type completions.
++        """
++        #print("Completer->_postfix_completer")
++        #print("   e=%s t=%s c=%s" % (expr, token, cruft))
++
++        # the token can be none as a result of the parent RE.
++        if token is None:
++            token = ''
++        
++        # get the object
++        # -- this may not be possible if it is part of a global
++        obj = ns_lookup_fn(expr+token+cruft)
++        if obj:
++            # odjust the params to reflect the new object
++            expr = expr + token + cruft
++            token = ''
++            cruft = ''
++        else:
++            # look up the base item
++            obj = ns_lookup_fn(expr)
++
++        # sort them out
++        if token == PostFix.CALL:
++            return self.__call_completions(expr, token, cruft, obj)
++        elif token == PostFix.DICT:
++            return self.__dict_completions(expr, token, cruft, obj)
++        elif token == PostFix.LIST:
++            return self.__list_completions(expr, token, cruft, obj)
++
++        # treat it as a plain object
++        return self.__object_completions(expr, token, cruft, obj)
++
+     def global_matches(self, text):
+         """Compute matches when text is a simple name.
+ 
+@@ -310,18 +650,19 @@ class Completer(Configurable):
+         defined in self.namespace or self.global_namespace that match.
+ 
+         """
+-        #print 'Completer->global_matches, txt=%r' % text # dbg
+-        matches = []
+-        match_append = matches.append
+-        n = len(text)
+-        for lst in [keyword.kwlist,
+-                    __builtin__.__dict__.keys(),
+-                    self.namespace.keys(),
+-                    self.global_namespace.keys()]:
+-            for word in lst:
+-                if word[:n] == text and word != "__builtins__":
+-                    match_append(word)
+-        return matches
++        #print('Completer->global_matches, txt=%r' % text) # dbg
++
++        # sort out the components
++        m = re.match(r"(\w+)(\[\'|\[|\()?(\S*)$", text)
++        expr = m.group(1)
++        token = m.group(2)
++        cruft = m.group(3)
++
++        # catch the completions across object types
++        matches = self._postfix_completer(expr, token, cruft, self._global_lookup)
++        if matches is not None:
++            return matches
++        return []
+ 
+     def attr_matches(self, text):
+         """Compute matches when text contains a dot.
+@@ -338,44 +679,27 @@ class Completer(Configurable):
+         """
+ 
+         #io.rprint('Completer->attr_matches, txt=%r' % text) # dbg
+-        # Another option, seems to work great. Catches things like ''.<tab>
+-        m = re.match(r"(\S+(\.\w+)*)\.(\w*)$", text)
+-    
+-        if m:
+-            expr, attr = m.group(1, 3)
+-        elif self.greedy:
+-            m2 = re.match(r"(.+)\.(\w*)$", self.line_buffer)
+-            if not m2:
+-                return []
+-            expr, attr = m2.group(1,2)
+-        else:
++
++        pat = r"(\S+(\.\w+)*)(\.|\[\'|\[|\()(\S*)$"
++        m = re.match(pat, text)
++
++        if not m:
++            io.rprint("Failed to match ...")
+             return []
+-    
+-        try:
+-            obj = eval(expr, self.namespace)
+-        except:
+-            try:
+-                obj = eval(expr, self.global_namespace)
+-            except:
+-                return []
+ 
+-        if self.limit_to__all__ and hasattr(obj, '__all__'):
+-            words = get__all__entries(obj)
+-        else: 
+-            words = dir2(obj)
++        # group(0) is the whole string
++        expr = m.group(1)
++        # group(2) is always 'None'
++        token = m.group(3)
++        cruft = m.group(4)
++        #expr, attr = m.group(1, 3)
+ 
+-        try:
+-            words = generics.complete_object(obj, words)
+-        except TryNext:
+-            pass
+-        except Exception:
+-            # Silence errors from completion function
+-            #raise # dbg
+-            pass
+-        # Build match list to return
+-        n = len(attr)
+-        res = ["%s.%s" % (expr, w) for w in words if w[:n] == attr ]
+-        return res
++
++        # catch the completions across object types
++        foo = self._postfix_completer(expr, token, cruft, self._global_lookup)
++        if foo is not None:
++            return foo
++        return []
+ 
+ 
+ def get__all__entries(obj):
+@@ -393,13 +717,34 @@ class IPCompleter(Completer):
+ 
+     def _greedy_changed(self, name, old, new):
+         """update the splitter and readline delims when greedy is changed"""
++        #io.rprint("_greedy_changed: name=%s o=%d n%d" % (name, old, new))
+         if new:
+-            self.splitter.delims = GREEDY_DELIMS
++            self.splitter.delims = self.splitter._preferred_greedy_delims
+         else:
+-            self.splitter.delims = DELIMS
++            self.splitter.delims = self.splitter._preferred_delims
+ 
+         if self.readline:
+             self.readline.set_completer_delims(self.splitter.delims)
++
++    #
++    #  This is the implicit callback for applying changes to the 'use_postfix'
++    # configuration parameter.
++    #
++    def _use_postfix_changed(self, name, old, new):
++        """engage the correct delims
++        """
++        #io.rprint("_use_postfix_changed: name=%s o=%d n%d" % (name, old, new))
++        if new:
++            self.splitter._preferred_delims = PostFix.DELIMS
++        else:
++            self.splitter._preferred_delims = DELIMS
++
++        # update the parser
++        self.splitter.delims = self.splitter._preferred_delims
++
++        # update readline
++        if self.readline:
++            self.readline.set_completer_delims(self.splitter.delims)
+     
+     merge_completions = CBool(True, config=True,
+         help="""Whether to merge completion results into a single list
+@@ -643,24 +988,24 @@ class IPCompleter(Completer):
+         """Match attributes or global python names"""
+         
+         #io.rprint('Completer->python_matches, txt=%r' % text) # dbg
+-        if "." in text:
+-            try:
+-                matches = self.attr_matches(text)
+-                if text.endswith('.') and self.omit__names:
+-                    if self.omit__names == 1:
+-                        # true if txt is _not_ a __ name, false otherwise:
+-                        no__name = (lambda txt:
+-                                    re.match(r'.*\.__.*?__',txt) is None)
+-                    else:
+-                        # true if txt is _not_ a _ name, false otherwise:
+-                        no__name = (lambda txt:
+-                                    re.match(r'.*\._.*?',txt) is None)
+-                    matches = filter(no__name, matches)
+-            except NameError:
+-                # catches <undefined attributes>.<tab>
+-                matches = []
+-        else:
+-            matches = self.global_matches(text)
++        if "." not in text:
++            return self.global_matches(text)
++            
++        try:
++            matches = self.attr_matches(text)
++            if text.endswith('.') and self.omit__names:
++                if self.omit__names == 1:
++                    # true if txt is _not_ a __ name, false otherwise:
++                    no__name = (lambda txt:
++                                re.match(r'.*\.__.*?__',txt) is None)
++                else:
++                    # true if txt is _not_ a _ name, false otherwise:
++                    no__name = (lambda txt:
++                                re.match(r'.*\._.*?',txt) is None)
++                matches = filter(no__name, matches)
++        except NameError:
++            # catches <undefined attributes>.<tab>
++            matches = []
+ 
+         return matches
+ 
diff --git a/meta/recipes-devtools/python/ipython3_0.13.1.bb b/meta/recipes-devtools/python/ipython3_0.13.1.bb
new file mode 100644
index 0000000..33b1461
--- /dev/null
+++ b/meta/recipes-devtools/python/ipython3_0.13.1.bb
@@ -0,0 +1,71 @@
+SUMMARY = "Enhanced Python Shell - Python3"
+DESCRIPTION = "Enhanced Python3 Shell -- A really great shell."
+HOMEPAGE = "http://ipython.org/"
+SECTION = "devel/python"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://docs/source/about/license_and_copyright.txt;md5=3311a509e946df2ddf84507563e7b504"
+
+SRCNAME = "ipython"
+RPROVIDES_${PN} = "ipython3"
+DEPENDS = "less"
+RDEPENDS_${PN} = " \
+                  python3-compression \
+                  python3-core \
+                  python3-codecs \
+                  python3-ctypes \
+                  python3-crypt \
+                  python3-datetime \
+                  python3-debugger \
+                  python3-distribute \
+                  python3-distutils \
+                  python3-doctest \
+                  python3-io \
+                  python3-json \
+                  python3-lang \
+                  python3-logging \
+                  python3-math \
+                  python3-misc \
+                  python3-modules \
+                  python3-netclient \
+                  python3-pickle \
+                  python3-pkgutil \
+                  python3-pprint \
+                  python3-pydoc \
+                  python3-re \
+                  python3-readline \
+                  python3-resource \
+                  python3-shell \
+                  python3-stringold \
+                  python3-subprocess \
+                  python3-terminal \
+                  python3-textutils \
+                  python3-threading \
+                  python3-unittest \
+                  python3-unixadmin \
+                "
+RRECOMMENDS_${PN} = " \
+                  python3-nose \
+                  python3-pyzmq \
+                  "
+
+SRC_URI = "http://archive.ipython.org/release/${PV}/ipython-${PV}.tar.gz \
+           file://001-completer-across-raw-types.patch \
+          "
+
+# pick up the v3 toolset
+inherit setuptools3
+
+FILES_${PN} = "/"
+
+SRC_URI[md5sum] = "ca7e75f7c802afc6aaa0a1ea59846420"
+SRC_URI[sha256sum] = "3bbf1095c4fd1fbf0a0871d9e26571a1ce3c4113d83ee3b688fa58e7e917f8c0"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+#do_unpackpost() {
+#  echo "PYTHON_BASEVERSION is " ${PYTHON_BASEVERSION}
+#  mv ${S}/../ipython-${PV}/* ${S}
+#}
+
+#addtask unpackpost after do_unpack before do_patch
diff --git a/meta/recipes-devtools/python/ipython_0.13.1.bb b/meta/recipes-devtools/python/ipython_0.13.1.bb
new file mode 100644
index 0000000..7ee8862
--- /dev/null
+++ b/meta/recipes-devtools/python/ipython_0.13.1.bb
@@ -0,0 +1,48 @@
+SUMMARY = "Enhanced Python Shell"
+DESCRIPTION = "Enhanced Python Shell -- A really great shell."
+HOMEPAGE = "http://ipython.org/"
+SECTION = "devel/python"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://docs/source/about/license_and_copyright.txt;md5=3311a509e946df2ddf84507563e7b504"
+
+RPROVIDES_${PN} = "ipython"
+DEPENDS = "less"
+RDEPENDS_${PN} = " \
+                  python-core \
+                  python-codecs \
+                  python-crypt \
+                  python-datetime \
+                  python-debugger \
+                  python-distribute \
+                  python-distutils \
+                  python-io \
+                  python-json \
+                  python-lang \
+                  python-misc \
+                  python-modules \
+                  python-netclient \
+                  python-pickle \
+                  python-pkgutil \
+                  python-pprint \
+                  python-pydoc \
+                  python-resource \
+                  python-shell \
+                  python-stringold \
+                  python-subprocess \
+                  python-terminal \
+                  python-textutils \
+                  python-threading \
+                  python-unixadmin \
+                "
+
+SRC_URI = "http://archive.ipython.org/release/${PV}/ipython-${PV}.tar.gz \
+           file://001-completer-across-raw-types.patch \
+          "
+
+inherit setuptools
+
+FILES_${PN} = "/"
+
+SRC_URI[md5sum] = "ca7e75f7c802afc6aaa0a1ea59846420"
+SRC_URI[sha256sum] = "3bbf1095c4fd1fbf0a0871d9e26571a1ce3c4113d83ee3b688fa58e7e917f8c0"
-- 
1.7.9.5


