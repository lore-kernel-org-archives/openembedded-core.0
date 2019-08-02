Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 851367EE79
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 15:22:23 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 207so68363907wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 08:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3AO8DghTdNs5DYo2cxud+X8WA5nrsJET7hO5UnoL98Y=;
	b=Z7yN7VV7jkdoErRgceAbt57HCj9AZwMU/ANJibDic7Hsgqiead/8yS1YvifbqWTdr4
	TaRSujI/NFZ8h4nVofvw/jeWwy2rbET1PgoEtlEMe7oNsv5r77lHtLxGRqzdJ9cs4Kex
	sFgxYSFIBQKfIYQGPE5L8x0CqvGgPK2d26aZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3AO8DghTdNs5DYo2cxud+X8WA5nrsJET7hO5UnoL98Y=;
	b=goWHfOP97ONPXfBl9/pB7Vw2AO5Hm+55sAcH2pKjnWz5xEZTe3ZKoah2/+1w4N0xGk
	MS0J5Pfuc4sM6TLeIFQfULjDewJhiA9Fdm/IcR6MxiUxWPoVgL63q4YrRkZvwiSgclW1
	MfVSuNto8RJngxAt2Vh7X2pG0qc7SyV23a3Rv87QBpbWhzHwI+UJ+oq+xc5dhtngCCl1
	AE7TOxVHOMssdKb5gnCvn+YdW0M9/ECArDsBIvo8aSJFIhdNMMf6jUrO3r8xwJSsc9Po
	/HklhKins9uOQTYrX/Hp+CpWId7M3zY+AJggFTHku+qfGQlc/9xfufmDcWuGp2iwX0M+
	juXw==
X-Gm-Message-State: APjAAAXxRLr8MCjZDi5GQfrdH7Wo82YAnljMf0JkNasOMf6MtVQKDYzt
	hnTrCGkABBwZD/6BAbLbdJIn4rfTAu8=
X-Google-Smtp-Source: APXvYqzHs24n5if1FhjPonDYX+4B8KuefkG5cNOKs0uI4SK+1yQBQZhzg1LRLdwBAAmaZzjkGBKymg==
X-Received: by 2002:a7b:c104:: with SMTP id w4mr5215163wmi.42.1564759343794;
	Fri, 02 Aug 2019 08:22:23 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r4sm46734991wrq.82.2019.08.02.08.22.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 08:22:23 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 16:22:15 +0100
Message-Id: <20190802152220.16954-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802152220.16954-1-richard.purdie@linuxfoundation.org>
References: <20190802152220.16954-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/8] sstatesig: Move unihash siggen code to bitbake
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
X-List-Received-Date: Fri, 02 Aug 2019 15:22:23 -0000
Content-Transfer-Encoding: 8bit

This code is closely tied with the hash server in bitbake and also means
we can't relibably test the hashserv runqueue functionality without OE
metadata. Moving this to bitbake as a MixIn class makes most sense
and encourages code collaboration and reuse as well as enabling easier
and more accurate testing of the APIs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 163 +--------------------------------------
 1 file changed, 1 insertion(+), 162 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 13af16e473c..35d48f328de 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -266,7 +266,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         if error_msgs:
             bb.fatal("\n".join(error_msgs))
 
-class SignatureGeneratorOEEquivHash(SignatureGeneratorOEBasicHash):
+class SignatureGeneratorOEEquivHash(bb.siggen.SignatureGeneratorUniHashMixIn, SignatureGeneratorOEBasicHash):
     name = "OEEquivHash"
 
     def init_rundepcheck(self, data):
@@ -275,167 +275,6 @@ class SignatureGeneratorOEEquivHash(SignatureGeneratorOEBasicHash):
         self.method = data.getVar('SSTATE_HASHEQUIV_METHOD')
         self.unihashes = bb.persist_data.persist('SSTATESIG_UNIHASH_CACHE_v1_' + self.method.replace('.', '_'), data)
 
-    def get_taskdata(self):
-        return (self.server, self.method) + super().get_taskdata()
-
-    def set_taskdata(self, data):
-        self.server, self.method = data[:2]
-        super().set_taskdata(data[2:])
-
-    def __get_task_unihash_key(self, task):
-        # TODO: The key only *needs* to be the taskhash, the task is just
-        # convenient
-        return '%s:%s' % (task, self.taskhash[task])
-
-    def get_stampfile_hash(self, task):
-        if task in self.taskhash:
-            # If a unique hash is reported, use it as the stampfile hash. This
-            # ensures that if a task won't be re-run if the taskhash changes,
-            # but it would result in the same output hash
-            unihash = self.unihashes.get(self.__get_task_unihash_key(task))
-            if unihash is not None:
-                return unihash
-
-        return super().get_stampfile_hash(task)
-
-    def get_unihash(self, task):
-        import urllib
-        import json
-
-        taskhash = self.taskhash[task]
-
-        key = self.__get_task_unihash_key(task)
-
-        # TODO: This cache can grow unbounded. It probably only needs to keep
-        # for each task
-        unihash = self.unihashes.get(key)
-        if unihash is not None:
-            return unihash
-
-        # In the absence of being able to discover a unique hash from the
-        # server, make it be equivalent to the taskhash. The unique "hash" only
-        # really needs to be a unique string (not even necessarily a hash), but
-        # making it match the taskhash has a few advantages:
-        #
-        # 1) All of the sstate code that assumes hashes can be the same
-        # 2) It provides maximal compatibility with builders that don't use
-        #    an equivalency server
-        # 3) The value is easy for multiple independent builders to derive the
-        #    same unique hash from the same input. This means that if the
-        #    independent builders find the same taskhash, but it isn't reported
-        #    to the server, there is a better chance that they will agree on
-        #    the unique hash.
-        unihash = taskhash
-
-        try:
-            url = '%s/v1/equivalent?%s' % (self.server,
-                    urllib.parse.urlencode({'method': self.method, 'taskhash': self.taskhash[task]}))
-
-            request = urllib.request.Request(url)
-            response = urllib.request.urlopen(request)
-            data = response.read().decode('utf-8')
-
-            json_data = json.loads(data)
-
-            if json_data:
-                unihash = json_data['unihash']
-                # A unique hash equal to the taskhash is not very interesting,
-                # so it is reported it at debug level 2. If they differ, that
-                # is much more interesting, so it is reported at debug level 1
-                bb.debug((1, 2)[unihash == taskhash], 'Found unihash %s in place of %s for %s from %s' % (unihash, taskhash, task, self.server))
-            else:
-                bb.debug(2, 'No reported unihash for %s:%s from %s' % (task, taskhash, self.server))
-        except urllib.error.URLError as e:
-            bb.warn('Failure contacting Hash Equivalence Server %s: %s' % (self.server, str(e)))
-        except (KeyError, json.JSONDecodeError) as e:
-            bb.warn('Poorly formatted response from %s: %s' % (self.server, str(e)))
-
-        self.unihashes[key] = unihash
-        return unihash
-
-    def report_unihash(self, path, task, d):
-        import urllib
-        import json
-        import tempfile
-        import base64
-        import importlib
-
-        taskhash = d.getVar('BB_TASKHASH')
-        unihash = d.getVar('BB_UNIHASH')
-        report_taskdata = d.getVar('SSTATE_HASHEQUIV_REPORT_TASKDATA') == '1'
-        tempdir = d.getVar('T')
-        fn = d.getVar('BB_FILENAME')
-        key = fn + '.do_' + task + ':' + taskhash
-
-        # Sanity checks
-        cache_unihash = self.unihashes.get(key)
-        if cache_unihash is None:
-            bb.fatal('%s not in unihash cache. Please report this error' % key)
-
-        if cache_unihash != unihash:
-            bb.fatal("Cache unihash %s doesn't match BB_UNIHASH %s" % (cache_unihash, unihash))
-
-        sigfile = None
-        sigfile_name = "depsig.do_%s.%d" % (task, os.getpid())
-        sigfile_link = "depsig.do_%s" % task
-
-        try:
-            sigfile = open(os.path.join(tempdir, sigfile_name), 'w+b')
-
-            locs = {'path': path, 'sigfile': sigfile, 'task': task, 'd': d}
-
-            (module, method) = self.method.rsplit('.', 1)
-            locs['method'] = getattr(importlib.import_module(module), method)
-
-            outhash = bb.utils.better_eval('method(path, sigfile, task, d)', locs)
-
-            try:
-                url = '%s/v1/equivalent' % self.server
-                task_data = {
-                    'taskhash': taskhash,
-                    'method': self.method,
-                    'outhash': outhash,
-                    'unihash': unihash,
-                    'owner': d.getVar('SSTATE_HASHEQUIV_OWNER')
-                    }
-
-                if report_taskdata:
-                    sigfile.seek(0)
-
-                    task_data['PN'] = d.getVar('PN')
-                    task_data['PV'] = d.getVar('PV')
-                    task_data['PR'] = d.getVar('PR')
-                    task_data['task'] = task
-                    task_data['outhash_siginfo'] = sigfile.read().decode('utf-8')
-
-                headers = {'content-type': 'application/json'}
-
-                request = urllib.request.Request(url, json.dumps(task_data).encode('utf-8'), headers)
-                response = urllib.request.urlopen(request)
-                data = response.read().decode('utf-8')
-
-                json_data = json.loads(data)
-                new_unihash = json_data['unihash']
-
-                if new_unihash != unihash:
-                    bb.debug(1, 'Task %s unihash changed %s -> %s by server %s' % (taskhash, unihash, new_unihash, self.server))
-                else:
-                    bb.debug(1, 'Reported task %s as unihash %s to %s' % (taskhash, unihash, self.server))
-            except urllib.error.URLError as e:
-                bb.warn('Failure contacting Hash Equivalence Server %s: %s' % (self.server, str(e)))
-            except (KeyError, json.JSONDecodeError) as e:
-                bb.warn('Poorly formatted response from %s: %s' % (self.server, str(e)))
-        finally:
-            if sigfile:
-                sigfile.close()
-
-                sigfile_link_path = os.path.join(tempdir, sigfile_link)
-                bb.utils.remove(sigfile_link_path)
-
-                try:
-                    os.symlink(sigfile_name, sigfile_link_path)
-                except OSError:
-                    pass
 
 # Insert these classes into siggen's namespace so it can see and select them
 bb.siggen.SignatureGeneratorOEBasic = SignatureGeneratorOEBasic
-- 
2.20.1


